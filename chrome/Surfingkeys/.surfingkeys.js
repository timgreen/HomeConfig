unmap('se');
unmap('sb');
unmap('ow');
unmap('B');
unmap('ga');
unmap('F');

settings.startToShowEmoji = 10;

// Follow links
settings.hintAlign = 'left';
Hints.characters = 'asdfghjkl';

// only keep E, R and T from Surfingkeys for some sites.
unmapAllExcept(['E', 'R', 'T'], /(mail|inbox|research|docs).google.com/);
unmapAllExcept([], /cad.onshape.com\/documents\//);
