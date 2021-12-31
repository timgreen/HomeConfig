api.unmap('se');
api.unmap('sb');
api.unmap('ow');
api.unmap('B');
api.unmap('ga');
api.unmap('F');

settings.startToShowEmoji = 10;

// Follow links
settings.hintAlign = 'left';
api.Hints.characters = 'asdfghjkl';

// only keep E, R and T from Surfingkeys for some sites.
api.unmapAllExcept(['E', 'R', 'T'], /(mail|inbox|research|docs).google.com/);
api.unmapAllExcept([], /cad.onshape.com\/documents\//);
api.unmapAllExcept([], /remotedesktop.google.com/);

api.unmapAllExcept([], /github.dev/);
api.unmapAllExcept([], /www.figma.com/);
