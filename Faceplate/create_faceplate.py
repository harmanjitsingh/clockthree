'''
download fonts from: 
    http://openfontlibrary.org
    http://code.google.com/webfonts
    http://www.font-zone.com/

    download images from:
    thenounproject.com
    
'''
test = 1
from numpy import *
import PIL.Image
from reportlab.pdfgen import canvas
from reportlab.graphics import renderPDF
from reportlab.graphics.shapes import Drawing, Group, String, Circle, Rect
from reportlab.lib.units import inch, mm, cm
from reportlab.lib.colors import pink, black, red, blue, green, white
from reportlab.platypus import Paragraph, SimpleDocTemplate, Table, TableStyle
from numpy import arange
import create_baffle_grid
from copy import deepcopy

LASER_THICKNESS = .01 * inch
ACRYLIC_THICKNESS = .06 * inch+ .2*mm
# ACRYLIC_THICKNESS = 3 * mm

DEG = pi/180.
DTHETA = 2.5
STANDOFF_OR = 4.7 / 2 * mm
STANDOFF_IR = 3.0 / 2 * mm
STANDOFF_H = 20 * mm
STRUT_W = .2 * inch
MOUNT_R = STANDOFF_OR + 2 * mm
# MOUNT_R = STRUT_W / 2.
THETA_EXTRA = arccos((STRUT_W / 2) / MOUNT_R) / DEG

THETAS = arange(-THETA_EXTRA, 180 + THETA_EXTRA, DTHETA)

class Line:
    def __init__(self, p1, p2):
        self.p1 = array(p1, copy=True)
        self.p2 = array(p2, copy=True)

    def __call__(self, s):
        return self.p1 + s * (self.p2 - self.p1)

    def intersect(self, other):
        M = transpose([self.p1 - self.p2, other.p2 - other.p1])
        x = dot(linalg.inv(M), self.p1 - other.p1)
        return self(x[0])
    
    def parallel(self, through):
        return Line(through, self.p2 + through - self.p1)
    
    def __add__(self, v):
        return Line(self.p1 + v, self.p2 + v)
    
    def __sub__(self, v):
        return self + (-v)
    
    def drawOn(self, canvas):
        canvas.line(self.p1[0], self.p1[1], self.p2[0], self.p2[1])

class MyPath:
    UNIT = cm
    def __init__(self):
        self.points = []
        self.paths = []
        self.holes = []
        self.subtract = []
    def copy(self):
        out = MyPath()
        out.points = deepcopy(self.points)
        out.paths = deepcopy(self.paths)
        out.holes = deepcopy(self.holes)
        out.subtract = deepcopy(self.subtract)
        return out
        
    def moveTo(self, x, y):
        self.points.append([x, y])
        self.paths.append([])
        self.paths[-1].append(len(self.points) - 1)
    def lineTo(self, x, y):
        self.points.append([x, y])
        self.paths[-1].append(len(self.points) - 1)

    def getleft(self):
        return min([l[0] for l in self.points])
    def getright(self):
        return max([l[0] for l in self.points])
    def getbottom(self):
        return min([l[1] for l in self.points])
    def gettop(self):
        return max([l[1] for l in self.points])
    
    def toPDF(self, filename):
        W = self.getright() - self.getleft()
        H = self.gettop() - self.getbottom()
        c = canvas.Canvas(filename,
                          pagesize=(W + .5 * inch, H + .5 * inch)
                          )
        c.setLineWidth(1/64. * inch)
        self.translate(-self.getleft() + .25 * inch, -self.getbottom() + .25 * inch)
        self.drawOn(c)
        return c

    def drawOn(self, c, linewidth=1/64. * inch):
        p = c.beginPath()
        c.setLineWidth(linewidth)
        for path in self.paths:
            p.moveTo(*self.points[path[0]])
            for i in path[1:]:
                p.lineTo(*self.points[i])
        for x, y, r in self.holes:
            c.circle(x, y, r)
        for poly in self.subtract:
            poly.drawOn(c)
        c.drawPath(p)

    def rotate(self, rotate_deg):
        theta = rotate_deg * pi / 180.
        rot_mat = array([[cos(theta), -sin(theta)],
                         [sin(theta), cos(theta)]])
        self.points = list(dot(self.points, rot_mat))

    def translate(self, dx, dy):
        for l in self.points:
            l[0] += dx
            l[1] += dy
        for xyr in self.holes:
            xyr[0] += dx
            xyr[1] += dy
        for s in self.subtract:
            s.translate(dx, dy)
    def scale(self, f):
        for l in self.points:
            l[0] *= f
            l[1] *= f
        for xyr in self.holes:
            xyr[0] *= f
            xyr[1] *= f
            xyr[2] *= f
        for s in self.subtract:
            s.scale(f)
        
    def drill(self, x, y, r):
        self.holes.append([x, y, r])
    def route(self, polygon):
        self.subtract.append(deepcopy(polygon))
    def getBottom(self):
        return min(l[1] for l in self.points)
    def getTop(self):
        return max(l[1] for l in self.points)
    def getLeft(self):
        return min(l[0] for l in self.points)
    def getRight(self):
        return max(l[0] for l in self.points)
    def toOpenScad(self, thickness, outfile):
        if len(self.holes) > 0 or len(self.subtract) > 0:
            print >> outfile, 'difference(){'
        print >> outfile, '''\
linear_extrude(height=%s, center=true, convexity=10, twist=0)
polygon(points=[''' % (thickness / cm)
        for x, y in self.points:
            print >> outfile, '[%s, %s],' % (x / cm, y / cm)
        print >> outfile, '],'
        print >> outfile, 'paths=['
        for path in self.paths:
            print >> outfile, '%s,' % path
        print >> outfile, ']);'

        if len(self.holes) > 0 or len(self.subtract) > 0:
            for hole in self.holes:
                x, y, r = hole
                print >> outfile, 'translate(v=[%s, %s, -5*inch])' % (x/cm, y/cm)
                print >> outfile, 'cylinder(h=10*inch, r=%s, $fn=25);' % (r / cm)# ((STANDOFF_IR + .1 * mm) / cm)
            for poly in self.subtract:
                print >> outfile, '//subtract'
                ## print >> outfile, 'translate(v=[0, 0, -%s])' % (thickness / cm)
                poly.toOpenScad(thickness * 2, outfile)
            print >> outfile, '}'

def create_baffle(gh, gw, n_notch, delta, tab_width=0., margin=.1*mm):
    p = MyPath()
    p.moveTo(0, 0)
    p.lineTo(0, gw)
    p.lineTo(-tab_width, gw)
    p.lineTo(-tab_width, gh - gw)
    p.lineTo(0, gh - gw)
    p.lineTo(0, gh)

    for i in range(1, n_notch + 1):
        x = delta * i
        p.lineTo(x - gw / 2, gh)
        p.lineTo(x - gw / 2 - margin, gh / 2 - margin) # add extra width in notch
        p.lineTo(x + gw / 2 - margin, gh / 2 - margin) # add extra width in notch
        p.lineTo(x + gw / 2, gh)

    p.lineTo(delta * (n_notch + 1), gh)
    p.lineTo(delta * (n_notch + 1), gh - gw)
    p.lineTo(delta * (n_notch + 1) + tab_width, gh - gw)
    p.lineTo(delta * (n_notch + 1) + tab_width, gw)
    p.lineTo(delta * (n_notch + 1), gw)
    p.lineTo(delta * (n_notch + 1), 0)
    p.lineTo(0, 0)
    return p

l1 = Line([0, 1], [1, 2])
l2 = Line([1, -1], [0, 0])
assert linalg.norm(l1.intersect(l2) - l2.intersect(l1)) < 1e-8

# we know some glyphs are missing, suppress warnings
# fonts available from http://openfontlibrary.org
# create your own fonts with fontforge! http://fontforge.sourceforge.net
# origianl hourglass by Clker.com
# http://commons.wikimedia.org/wiki/File:GreenHourglass.svg

import reportlab.rl_config
import codecs
reportlab.rl_config.warnOnMissingFontGlyphs = 0
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
import glob
import os.path

adobe2codec = {
    'WinAnsiEncoding':'winansi',
    'MacRomanEncoding':'macroman',
    'MacExpert':'macexpert',
    'PDFDoc':'pdfdoc',
}


dx = 9/15. * inch # .6 inch
dy = 9/15. * inch
N_COL = 16
N_ROW = 12
H = 9 * inch
W = 12 * inch

XOFFSET = .125 * inch
YOFFSET = .125 * inch

BOTTOM = 1 * inch - 7.5 * mm 
TOP = H - BOTTOM

LEFT = 1.5 * inch - 7.5 * mm 
XS = arange(LEFT, LEFT + dx * (N_COL + .01), dx)
YS = arange(TOP, TOP - dy * (N_ROW + .01), -dy) 

assert len(XS) == N_COL + 1, '%s != %s ' % (len(XS), N_COL + 1)
assert len(YS) == N_ROW + 1, '%s != %s ' % (len(YS), N_ROW + 1)
# YS = H - YS # from bottom

DX = (W - 2 * LEFT) / float(N_COL)
dx = DX

class Image:
    def __init__(self, filename, x, y, w=None, h=None):
        self.filename = filename
        self.x = x
        self.y = y
        self.w = w
        self.h = h
    def drawOn(self, c):
        im = PIL.Image.open(self.filename)
        c.drawInlineImage(im, 
                          self.x, self.y, self.w, self.h)
    def translate(self, dx, dy):
        return Image(self.filename, self.x + dx, self.y + dy, self.w, self.h)

def draw(filename, data, images, fontname='Times-Roman', fontsize=30,
         faceplate=True, baffle=True, CFL=True, horizontal_baffles=False,
         vertical_baffles=False, scad=False, explode=False, pcb_outline=False):
    c = canvas.Canvas(filename,
#                       pagesize=(W + 2 * XOFFSET, H + 2 * YOFFSET),
#                       pagesize=(13*inch, 10*inch)
                      pagesize=(17*inch, 11*inch)
                      )
    c.translate(2.5 * inch, 1. * inch)
    c.setTitle("ClockTHREE Faceplate: %s" % fontname)
    c.setFont(fontname, fontsize)
    # c.setFont("Helvetica", 14)
    if pcb_outline:
        c.rect(0*inch, 0*inch, 12*inch, 9*inch)
    c.line(-1 * inch,  -.5*inch, -.55 * inch, -.5*inch)
    c.line(12.55 * inch,  -.5*inch, 13. * inch, -.5*inch)
    c.line(-1 * inch,  9.5*inch, -.55 * inch, 9.5*inch)
    c.line(12.55 * inch,  9.5*inch, 13. * inch, 9.5*inch)

    c.line(-.5*inch, -1*inch, -.5*inch, -.55 * inch)
    c.line(12.5*inch, -1*inch, 12.5*inch, -.55 * inch)    
    c.line(-.5*inch, 10*inch, -.5*inch, 9.55 * inch)
    c.line(12.5*inch, 10*inch, 12.5*inch, 9.55 * inch)
    
    # c.getAvailableFonts()
    # c.stringWidth('Hello World')
    # c.drawString(0 * inch, 5 * inch, 'HelloWorld')
    
    c.setLineWidth(1/64. * inch)
    startx = .15 * inch 
    starty = .15 * inch 
    hole_sepx = (W - 2 * startx) / 4.
    hole_sepy = (H - 2 * starty) / 3.

    mounts = [] # lower left
    for i in range(5):          
        if i != 1:
            mounts.append(array([startx + i * hole_sepx, starty]))             # bottom row
    SW = mounts[0]
    SE = mounts[-1]
            
    for i in range(1, 3):
        mounts.append(array([startx + 4 * hole_sepx, starty + i * hole_sepy]))
    for i in range(4, -1, -1):
        mounts.append(array([startx + i * hole_sepx, starty + hole_sepy * 3])) # top row
    NE = mounts[-5]
    NW = mounts[-1]
    for i in range(3, -1, -1):
        mounts.append(array([startx, starty + i * hole_sepy]))

    if baffle:
        c.setLineJoin(1)
        lw = .075 * inch
        c.setLineWidth(1./64*inch)
        
        c.drawCentredString(W/2, H/2, 'DRAFT for quote only.  Do not fabricate.')

        for x in XS[:-1]:
            for y in YS[1:]:
                # c.rect(x + lw, y + lw, dx - 2 * lw, dy -2 * lw)
                # c.circle(x + dx / 2., y + dy / 2., 5*mm)
                pass
        
        # bug
        # c.rect(2.826 * inch, .05 * inch, .3*inch, .4*inch)
        # ClockTHREE
        # c.rect(W - .75*inch, H - (3.3875 + .5)*inch, .5*inch, .5*inch)
     
        # w = r + 2 * mm
        # w = .1 * inch

        grid_SW = array([min(XS), min(YS)])
        grid_SE = array([max(XS), min(YS)])
        grid_NE = array([max(XS), max(YS)])
        grid_NW = array([min(XS), max(YS)])

        # top baffle frame
        top_frame = MyPath()
        top_frame.moveTo( -.5 * inch, -.5 * inch)
        top_frame.lineTo(12.5 * inch, -.5 * inch)
        top_frame.lineTo(12.5 * inch, 9.5 * inch)
        top_frame.lineTo( -.5 * inch, 9.5 * inch)
        top_frame.lineTo( -.5 * inch, -.5 * inch)
        top_frame.drawOn(c)
        

        # cut out center
        top_frame.moveTo(XS[0], YS[-1])
        top_frame.lineTo(XS[0], YS[0])
        top_frame.lineTo(XS[-1], YS[0])
        top_frame.lineTo(XS[-1], YS[-1])
        top_frame.lineTo(XS[0], YS[-1])

        # clear top cover
        clear_cover = MyPath()
        clear_cover.moveTo(-.5 * inch, -.5 * inch)
        clear_cover.lineTo(12.5 * inch, -.5 * inch)
        clear_cover.lineTo(12.5 * inch, 9.5 * inch)
        clear_cover.lineTo(-.5 * inch, 9.5 * inch)
        clear_cover.lineTo(-.5 * inch, -.5 * inch)

        # black back cover
        back_cover = MyPath()
        back_cover.moveTo(-.5 * inch, -.5 * inch)
        back_cover.lineTo(12.5 * inch, -.5 * inch)
        back_cover.lineTo(12.5 * inch, 9.5 * inch)
        back_cover.lineTo(-.5 * inch, 9.5 * inch)
        back_cover.lineTo(-.5 * inch, -.5 * inch)
        
        
        # Middle bottom
        bottom_frame = MyPath()
        first = mounts[1][0] + STRUT_W / 2, grid_SE[1] - STRUT_W
        bottom_frame.moveTo(*first)
        
        if False: # right lower middle SSE
            next = mounts[2][0] - STRUT_W / 2, grid_SW[1]- STRUT_W
            bottom_frame.lineTo(*next)
            # next = mounts[2][0] - STRUT_W / 2, mounts[2][1]
            bottom_frame.lineTo(*next)

            for theta in (THETAS - 180) * DEG:
                next = mounts[2] + [MOUNT_R * cos(theta), 
                                    MOUNT_R * sin(theta)]
                bottom_frame.lineTo(*next)
        else:
            next = first
        next = next[0], grid_SE[1] - STRUT_W 
        bottom_frame.lineTo(*next)

        # SE corner
        V = SE - grid_SE
        d = linalg.norm(V)
        V /= d
        Vperp = array([-V[1], V[0]])

        l1 = Line(grid_SE, grid_SW) - array([0, STRUT_W ])
        l2 = Line(grid_SE, SE) - Vperp * STRUT_W / 2
        next = l1.intersect(l2)
        bottom_frame.lineTo(*next)

        for theta in (-THETAS + 180) * DEG:
        # for theta in arange(180 + THETA_EXTRA, 0 - THETA_EXTRA, -DTHETA) * DEG:
            next = SE + (MOUNT_R * sin(theta) * V + 
                         MOUNT_R * cos(theta) * Vperp)
            bottom_frame.lineTo(*next)

        l1 = Line(grid_SE, grid_NE) + array([STRUT_W, 0])
        l2 = Line(grid_SE, SE) + Vperp * STRUT_W / 2
        next = l1.intersect(l2)
        bottom_frame.lineTo(*next)
        
        if False: # right side
            for m_i in [4, 5]:
                next = grid_SE[0] + STRUT_W, mounts[m_i][1] - STRUT_W / 2
                bottom_frame.lineTo(*next)
                next = mounts[m_i][0], mounts[m_i][1] - STRUT_W / 2
                for theta in (THETAS -90) * DEG:
                    next = mounts[m_i] + [MOUNT_R * cos(theta), 
                                          MOUNT_R * sin(theta)]
                    bottom_frame.lineTo(*next)
                next = grid_SE[0] + STRUT_W, mounts[m_i][1] + STRUT_W / 2
                bottom_frame.lineTo(*next)

        V = NE - grid_NE
        d = linalg.norm(V)
        V /= d
        Vperp = array([-V[1], V[0]])

        l1 = Line(grid_NE, grid_SE) + [STRUT_W, 0]
        l2 = Line(grid_NE, NE) - Vperp * STRUT_W / 2
        next = l1.intersect(l2)
        bottom_frame.lineTo(*next)
        for theta in (-THETAS + 180) * DEG:
            next = NE + (MOUNT_R * sin(theta) * V + 
                         MOUNT_R * cos(theta) * Vperp)
            bottom_frame.lineTo(*next)
        l1 = Line(grid_NW, grid_NE) + [0, STRUT_W]
        l2 = Line(grid_NE, NE) + Vperp * STRUT_W / 2
        next = l1.intersect(l2)
        bottom_frame.lineTo(*next)
        
        for i in [8]: # top 3: [7, 8, 9] gets each hole in top
            next = mounts[i][0] + STRUT_W / 2, l1.p1[1]
            bottom_frame.lineTo(*next)
            for theta in (THETAS) * DEG:
            # for theta in arange(0 - THETA_EXTRA, 180 + THETA_EXTRA, DTHETA) * DEG:
                next = mounts[i] + [MOUNT_R * cos(theta),  
                                    MOUNT_R * sin(theta)]
                bottom_frame.lineTo(*next)

            next = mounts[i][0] - STRUT_W / 2, l1.p1[1]
            bottom_frame.lineTo(*next)
        
        V = NW - grid_NW
        d = linalg.norm(V)
        V /= d
        Vperp = array([-V[1], V[0]])

        l1 = Line(grid_NW, grid_NE) + [0, STRUT_W]
        l2 = Line(NW, grid_NW) - STRUT_W / 2 * Vperp
        next = l1.intersect(l2)
        bottom_frame.lineTo(*next)
        for theta in (-THETAS + 180) * DEG:
            next = NW + (MOUNT_R * sin(theta) * V + 
                         MOUNT_R * cos(theta) * Vperp)
            bottom_frame.lineTo(*next)
            
        l1 = Line(grid_NW, grid_SW) - array([STRUT_W, 0])
        l2 = l2 + 2 * STRUT_W / 2 * Vperp
        next = l2.intersect(l1)
        bottom_frame.lineTo(*next)

        if False: # left side
            for i in [12, 13]:
                next = [grid_NW[0] - STRUT_W, mounts[i][1] + STRUT_W / 2]
                bottom_frame.lineTo(*next)
                for theta in (THETAS + 90) * DEG:
                # for theta in arange(90 - THETA_EXTRA, 270 + THETA_EXTRA, DTHETA) * DEG:
                    next = mounts[i] + [MOUNT_R * cos(theta),  
                                        MOUNT_R * sin(theta)]
                    bottom_frame.lineTo(*next)
                next = grid_NW[0] - STRUT_W, mounts[i][1] - STRUT_W / 2
                bottom_frame.lineTo(*next)

        V = SW - grid_SW
        d = linalg.norm(V)
        V /= d
        Vperp = array([-V[1], V[0]])

        l1 = Line(grid_NW, grid_SW) - array([STRUT_W, 0])
        l2 = Line(grid_SW, SW) - STRUT_W / 2 * Vperp
        next = l2.intersect(l1)
        bottom_frame.lineTo(*next)
        for theta in (-THETAS + 180) * DEG:
            next = SW + (MOUNT_R * sin(theta) * V + 
                         MOUNT_R * cos(theta) * Vperp)
            bottom_frame.lineTo(*next)

        l1 = Line(grid_SW, grid_SE) - array([0, STRUT_W])
        l2 = l2 + 2 * STRUT_W / 2 * Vperp
        next = l1.intersect(l2)
        bottom_frame.lineTo(*next)
        next = mounts[1][0] - STRUT_W / 2, grid_SW[1] - STRUT_W
        bottom_frame.lineTo(*next)
        
        for theta in (THETAS + 180) * DEG:
            next = mounts[1] + [MOUNT_R * cos(theta),  
                                MOUNT_R * sin(theta)]
            bottom_frame.lineTo(*next)

        bottom_frame.lineTo(*first)

        # cut out center
        bottom_frame.moveTo(XS[0], YS[-1])
        bottom_frame.lineTo(XS[0], YS[0])
        bottom_frame.lineTo(XS[-1], YS[0])
        bottom_frame.lineTo(XS[-1], YS[-1])
        bottom_frame.lineTo(XS[0], YS[-1])

        bottom_frame.drawOn(c)
        
    face_mounts = [mounts[0], mounts[1], mounts[3],
                   mounts[6], mounts[8], mounts[11]]
    if baffle:
        c.setLineWidth(1/64. * inch)
        for x, y in face_mounts:
            c.circle(x, y, STANDOFF_IR, fill=False)
    else:
        c.setLineWidth(1/64. * inch)
        for x, y in face_mounts:
            r = 1 /64. * inch
            c.circle(x, y, r, fill=True)

    t=Table(data, N_COL*[dx], N_ROW*[dy])
    t.setStyle(TableStyle(
            [('FONTNAME', (0, 0), (N_COL - 1, N_ROW - 1), fontname),
             ('FONTSIZE', (0, 0), (N_COL - 1, N_ROW - 1), fontsize),
             ('ALIGN', (0, 0), (N_COL - 1, N_ROW - 1), 'CENTRE'),
             ]))

    t.wrap(W, H)
    if faceplate:
        t.drawOn(c, XS[0], YS[-2] - dy/2.5)
        for im in images:
            im.drawOn(c)
        encName = 'winansi'
        decoder = codecs.lookup(encName)[1]
        def decodeFunc(txt):
            if txt is None:
                return None
            else:
                return decoder(txt, errors='replace')[0]
        if CFL: 
            # draw deg C and def F
            c.drawCentredString(XS[-4] - dx/2, YS[-1] + dy/4,
                                decodeFunc(chr(186) + 'C'))
            c.drawCentredString(XS[-3] - dx/2, YS[-1] + dy/4,
                                decodeFunc(chr(186) + 'F'))
            # draw clock slash
            c.setLineWidth(1 * mm)
            c.setLineJoin(1)
            c.line(XS[-2] + dx/10., YS[-1] + dx/10.,
                   XS[-1] - dx/10., YS[-2] - dy/10.)

    baffle_height = 20.00 * mm + 2 * ACRYLIC_THICKNESS
    baffle_h = create_baffle(baffle_height,
                             ACRYLIC_THICKNESS, 15, dx,
                             tab_width=STRUT_W)
    baffle_v = create_baffle(baffle_height,
                             ACRYLIC_THICKNESS, 11, dy,
                             STRUT_W)
    if scad:
        scad = open('baffle.scad', 'w')
        print >> scad, 'inch = %s;' % (inch / cm)
        print >> scad, 'module frame(){'
        print >> scad, '  color([ 0, 0, 0, 1.0 ])'
        if explode:
            print >> scad, 'translate(v=[0, 0, -2])'
        X = deepcopy(clear_cover)
        for x, y, in face_mounts:
            bottom_frame.drill(x, y, STANDOFF_IR + .25*mm)
            X.drill(x, y, STANDOFF_IR)
            top_frame.drill(x, y, STANDOFF_IR + .25*mm)
            clear_cover.drill(x, y, STANDOFF_IR + .25*mm)
            back_cover.drill(x, y, STANDOFF_IR + .25*mm)
        X.translate(-W / 2., -H / 2.)
        X.scale(cm / inch)
        Xf = open("top_frame_stl.scad", 'w')
        print >> Xf, 'translate(v=[0, 0, -0.5 * inch])'
        X.toOpenScad(ACRYLIC_THICKNESS, Xf)
        keyhole = MyPath()
        Center = 2. * inch, 7.5 * inch
        center = 2. * inch, 7.875 * inch
        r = .125 * inch
        R = .25 * inch
        phi = arcsin(r/R)
        
        start = Center[0] + R * cos(pi/2 + phi), Center[1] + R * sin(pi/2 + phi)
        keyhole.moveTo(*start)
        for theta in arange(pi/2 + phi,
                            2 * pi + pi / 2 - phi +DTHETA*DEG/2,
                            DTHETA * DEG):
            next = Center[0] + R * cos(theta), Center[1] + R * sin(theta)
            keyhole.lineTo(*next)
        for theta in arange(0, pi, DTHETA * DEG):
            next = center[0] + r * cos(theta), center[1] + r * sin(theta)
            keyhole.lineTo(*next)
        keyhole.lineTo(*start)
        back_cover.route(keyhole)
        keyhole.translate(8 * inch, 0 * inch)
        back_cover.route(keyhole)
        bottom_frame.toOpenScad(ACRYLIC_THICKNESS, scad)

        print >> scad, '}'

        print >> scad, 'color([ 0, 1, 1, 1 ]);'
        for x, y in face_mounts:
            print >> scad, 'translate(v=[%s, %s, %s])' % (x/cm, y/cm, ACRYLIC_THICKNESS/cm)
            print >> scad, '    difference(){'
            print >> scad, '    cylinder(h=%s, r=%s, $fn=25);' % (STANDOFF_H / cm, STANDOFF_OR / cm)
            print >> scad, '    cylinder(h=%s, r=%s, $fn=25);' % (STANDOFF_H / cm, STANDOFF_IR / cm)
            print >> scad, '}'
        print >> scad, '''\
translate(v=[0, 0, %s])
frame();''' % (ACRYLIC_THICKNESS/2/cm)

        # top_frame.translate(.5, .5)
        print >> scad, 'color([ 0, 0, 0, 1 ])'
        if explode:
            print >> scad, 'translate(v=[0, 0, 8])'
        else:
            print >> scad, 'translate(v=[0, 0, %s])'%((baffle_height - ACRYLIC_THICKNESS/2)/cm)        
        top_frame.toOpenScad(ACRYLIC_THICKNESS, scad);

        # clear cover
        print >> scad, '  color([ 0.9, 0.9, 0.9, 0.6 ])'
        if explode:
            print >> scad, 'translate(v=[0, 0, 10])'
        else:
            print >> scad, 'translate(v=[0, 0, %s])'%((baffle_height)/cm)
        clear_cover.toOpenScad(.25 * inch, scad);

        # wall_mount
        if True: # bottom cover
            print >> scad, '  color([ 0, 0, 0, 0.8 ])'
            if explode:
                print >> scad, 'translate(v=[0, 0, -3])'
            else:
                print >> scad, 'translate(v=[0, 0, %s])'%((-0.25*inch/2)/cm)
            back_cover.toOpenScad(0.25 * inch, scad);
        

        print >> scad, 'module baffle_h(){'
        print >> scad, 'color([ 1, 0.1, 0.1, 0.8 ])'
        print >> scad, "translate(v=[%s, %s, 0])" % (XS[0]/cm, YS[-2]/cm)
        print >> scad, "rotate(a=90, v=[1, 0, 0])"
        baffle_h.toOpenScad(ACRYLIC_THICKNESS, scad)
        print >> scad, '}'
        for i in range(11):
            print >> scad, 'translate(v=[0, %s, 0])' % (i * dy/cm)
            print >> scad, 'baffle_h();'
        
        print >> scad, 'module baffle_v(){'
        print >> scad, 'color([ 0.1, 1, 0.1, 0.8 ])'
        if explode:
            print >> scad, "translate(v=[%s,%s, 6])" % (XS[1] / cm,
                                                         YS[-1] / cm,
                                                        )
        else:
            print >> scad, "translate(v=[%s,%s, %s])" % (XS[1] / cm,
                                                        YS[-1] / cm,
                                                        baffle_height / cm)
        print >> scad, "rotate(a=90, v=[0, -1, 0])"
        print >> scad, "rotate(a=90, v=[0, 0, 1])"
        baffle_v.toOpenScad(ACRYLIC_THICKNESS, scad)
        print >> scad, '}'
        for i in range(15):
            print >> scad, 'translate(v=[%s, 0, 0])' % (i * DX/cm)
            print >> scad, 'baffle_v();'
        print 'wrote', scad.name
        
    if baffle: # check baffle grid size
        bc = back_cover.toPDF("hines/back_cover.pdf")
        C3_logo = Image('Images/ClockTHREE_Logo.png',
                         8*inch, 1*inch)
        C3_logo.drawOn(bc)
        textobject = bc.beginText()
        textobject.setTextOrigin(9.75*inch, .75*inch)
        textobject.setFont("Orbitron-Black", 14)
        textobject.textOut('ClockTHREE')
        bc.drawText(textobject)
        # bc.drawCentredString(10.75*inch, .5*inch, , fontsize=20)


        x = 1.25 * inch
        y = 1.25 * inch
        bc.drawString(x, y, 'WyoLum@gmail.com')
        bc.drawString(x, y - .25 * inch, 'http://sites.google.com/site/clockthreeishere')
        bc.drawString(x, y - .5 * inch, 'http://lumetron.com')
        bc.drawString(x, y - .75 * inch, 'http://wyoinnovation.blogspot.com')
        

        bc.showPage()
        bc.save()
        
        cc = clear_cover.toPDF("hines/front_cover.pdf")
        cc.showPage()
        cc.save()
        if horizontal_baffles:
            ystep = baffle_height + 5 * LASER_THICKNESS
            baffle_h.translate(STRUT_W + .1 * inch,
                               -baffle_height + .25 * inch)
            
            # c = canvas.Canvas(filename,
            #                   pagesize=(W + .5 * inch, H + .5 * inch)
            #                 )
            single_h = baffle_h.toPDF('hines/horizontal_baffle.pdf')
            single_h.showPage()
            single_h.save()
            
            hb = canvas.Canvas('hines/horizontal_baffles.pdf',
                                pagesize=(baffle_h.getright() - baffle_h.getleft() + .5 * inch,
                                          11 * (baffle_height + 5 * LASER_THICKNESS) + .5 * inch
                                          )
                             )
            for i in range(11):
                baffle_h.drawOn(hb)
                baffle_h.translate(0, ystep)
            hb.showPage()
            hb.save()


        if vertical_baffles:
            ystep = baffle_height + 2 * LASER_THICKNESS
            baffle_v.translate(XS[0] + STRUT_W + LASER_THICKNESS + .1 * inch,
                               YS[-1] - baffle_height + LASER_THICKNESS + .1 * inch)
            for i in range(7):
                baffle_v.translate(0, ystep)
                bottom_frame.route(baffle_v)
                top_frame.route(baffle_v)
                # baffle_v.drawOn(c)
            notab_baffle_v = create_baffle(baffle_height,
                                           ACRYLIC_THICKNESS, 11, dy,
                                           0)

            notab_baffle_v.translate(-notab_baffle_v.getleft(),
                                     -notab_baffle_v.getbottom())
            notab_baffle_v.rotate(-90)
            notab_baffle_v.translate(10 * inch, YS[-1])
            bottom_frame.route(notab_baffle_v)
            top_frame.route(notab_baffle_v)
            
            top_frame.drill((2.876 + .15) * inch, .25 * inch, .2*inch) # for BUG .3*inch, .4*inch
            top_frame.drill(11.5 * inch, 5.37*inch, .28*inch) # for Logo
            top_frame.drawOn(c)

            tf = top_frame.toPDF("hines/top_frame.pdf")
            for button in button_logos:
                button = button.translate(.75 * inch, .75 * inch)
                button.drawOn(tf)
            tf.showPage()
            tf.save()

            bf = bottom_frame.toPDF("hines/bottom_frame.pdf")
            bf.showPage()
            bf.save()

    c.showPage()
    c.save()
    print "Wrote %s." % filename
'''"ITSXATENRQUARTER"
  "TWENTYFIVEDPASTO"
  "TWELVETWONESEVEN"
  "FOURFIVESIXTHREE"
  "EIGHTENINELEVEN-"
  "BEERCHAIOCLOCKM-"
  "THIRTYUINITHEAT-"
  "MIDNIGHTEVENING-"
  "IXICLOCKTHREE78-"
  "MORNINGAFTERNOON"
  "THANKVIWEMNEED17"
  "YMDYMSALARMT  AN"'''
data = [
        ('I',"T'",'S','X','A','T','E','N','R','Q','U','A','R','T','E','R'),
        ('T','W','E','N','T','Y','F','I','V','E','D','P','A','S','T','O'),
        ('T','W','E','L','V','E','T','W','O','N','E','S','E','V','E','N'),
        ('F','O','U','R','F','I','V','E','S','I','X','T','H','R','E','E'),
        ('E','I','G','H','T','E','N','I','N','E','L','E','V','E','N',' '),
        ('B','E','E','R','C','H','A','I',"O'",'C','L','O','C','K','M',' '),
        ('T','H','I','R','T','Y','U','I','N','I','T','H','E','A','T',' '),
        ('M','I','D','N','I','G','H','T','E','V','E','N','I','N','G',' '),
        ('T','J','S','C','L','O','C','K','T','H','R','E','E','A','M',' '),
        ('M','O','R','N','I','N','G','A','F','T','E','R','N','O','O','N'),
        ('E','G','S','W','Y','O','L','U','M','A','C','S','E','C','S','H'),
        (' ','Y','M','D','H','M','S','A','L','A','R','M',' ',' ',' ',' ')]
example_data = [
        ('I',"T'",'S',' ','A',' ',' ',' ',' ','Q','U','A','R','T','E','R'),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','P','A','S','T',' '),
        ('T','W','E','L','V','E',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        ('M','I','D','N','I','G','H','T',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        (' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '),
        ]

bangla = [chr(c % 128) for c in range(16*12)]
bangla = reshape(bangla, (12, 16))
bangla = [tuple(l) for l in bangla]

images = [Image('Images/NounProject/noun_project_198.png',                       # BUG
                2.876 * inch, .05 * inch, .3*inch, .4*inch),                
          Image('Images/NounProject/noun_project_317.png',                       # clock  
                XS[-3] + dx * .17, YS[-1] + dy * .07, .4*inch, .5*inch),
          Image('Images/NounProject/noun_project_317.png',                       # clock
                XS[-2] + dx * .17, YS[-1] + dy * .07, .4*inch, .5*inch),
          Image('Images/NounProject/noun_project_140.png',                       # USB
                XS[0] + dx * .37, YS[-1] + dy * .25, .17*inch, .34*inch),
          Image('Images/ClockTHREE_soft.gif',                                    # ClockTHREE
                W - .75*inch, H - (3.3875 + .5)*inch, .5*inch, .5*inch),
          ]
button_logos = [
          Image('Images/mode.png',          # Mode
                (4.95 + .025)*inch, -.335*inch, .25*inch, .25*inch),
          Image('Images/dec.png',          # Mode
                5.55*inch, -.35*inch, .3*inch, .3*inch),
          Image('Images/inc.png',          # Mode
                6.15*inch, -.35*inch, .3*inch, .3*inch),
          Image('Images/enter.png',          # Mode
                6.75*inch, -.35*inch, .4*inch, .3*inch),

]

for i in range(5):
    images.append(Image('Images/hourglass%d.png' % i,
          XS[-2] + dx * .35, YS[5 + i] + dy * .25,
          dx * .3, dy * .56 ))

def test():    
    # draw("baffle_h.pdf", data, images, faceplate=False, baffle=True, horizontal_baffles=True)
    # draw("baffle_v.pdf", data, images, faceplate=False, baffle=True, vertical_baffles=True)
    draw("all.pdf", data, images, fontname='Ubuntu-Bold', faceplate=True, 
         baffle=True, vertical_baffles=True, horizontal_baffles=True,
         scad=True, explode=True, pcb_outline=True)

def main(fontnames):
    for fontname in fontnames:
        if fontname not in ignore_fonts:
            try:
                if (fontname.endswith('.ttf') or
                    fontname.endswith('.odf')):
                    continue
                # add_font(fontname)
                draw("faceplate_%s.pdf" % fontname, data, images, fontname=fontname, faceplate=True, baffle=False)
                draw("faceplate_%s_example.pdf" % fontname, example_data, [], fontname=fontname, faceplate=True, baffle=False, CFL=False)
            except Exception, e:
                print 'problem.  skipping %s' % fontname, e
                raise

def add_font(fontname):
    pdfmetrics.registerFont(TTFont(fontname, 'fonts/%s.ttf' % fontname))

ignore_fonts = ['ZapfDingbats', 'Symbol']
def add_all_fonts():
    global fontnames

    fontnames = pdfmetrics.getRegisteredFontNames()
    fontpaths = glob.glob('fonts/*.ttf')
    for fp in fontpaths:
        d, fn = os.path.split(fp)
        fontnames.append(fn[:-4])

        pdfmetrics.registerFont(TTFont(fn, fp))
        print 'added', fn, fontnames[-1]
# pdfmetrics.registerFont(TTFont('ShadheenLipi', 'fonts/ShadheenLipi.ttf'))

if __name__ == '__main__':
    import sys
    if len(sys.argv) == 1: # print all
        add_all_fonts()
        # main(fontnames)
        test()
        # main(['Vollkorn-Regular'])
    else:
        main(sys.argv[1:])
        # test()
    
