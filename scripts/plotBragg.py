#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May 31 11:35:19 2019

@author: ty
"""
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.axes as axes

####### user settings #######
hvals = list(np.round(Hvals[0,:],1))
kvals = list(np.round(Kvals[0,:],1))
lim = len(hvals)+1
dtick = 25

xmin = np.argwhere(np.array(hvals) < -8.5).max()
xmax = np.argwhere(np.array(hvals) > 8.5).min()
ymin = np.argwhere(np.array(kvals) < -8.5).max()
ymax = np.argwhere(np.array(kvals) > 8.5).min()

ind = 0

fname = 'no'

#########################################

fig, ax = plt.subplots(1,1)
ax = plt.imshow((sl[:,:,ind].T),interpolation='hamming',cmap='jet',aspect='equal')
fig.tight_layout()
ax.axes.set(xlabel='H (r.l.u)', ylabel='K (r.l.u)', title='TAS Bragg Peaks, (H K 0)')
ax.axes.set_xticks(np.arange(0,lim,dtick))
ax.axes.set_xticklabels(hvals[0::dtick])
ax.axes.set_xlim(left=xmin,right=xmax)
ax.axes.grid(True, linestyle=':', alpha=0.5, c=(0.5,0.5,0.5))
ax.axes.set_yticks(np.arange(0,lim,dtick))
ax.axes.set_yticklabels(kvals[0::dtick])
ax.axes.set_ylim(bottom=ymin,top=ymax)
#ax.axes.invert_yaxis()
fig.show()

if fname != 'no':
   fig.savefig(fname,format='png',dpi=600)