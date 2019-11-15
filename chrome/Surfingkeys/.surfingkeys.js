unmap('se');
unmap('sb');
unmap('ow');
unmap('B');
unmap('ga');
unmap('F');

settings.startToShowEmoji = 0;

// Follow links
settings.hintAlign = 'left';
Hints.characters = 'asdfghjkl';

// only keep E, R and T from Surfingkeys for some sites.
unmapAllExcept(['E', 'R', 'T'], /mail.google.com|inbox.google.com|research.google.com/);
