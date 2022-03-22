// Surfingkeys extension config file 
// ----
// Web Browser extension to navigate the web using VIM-like keybindings
// ----

/*-- Temporary config file until I organize a better way to write this configuration --*/
const {
    aceVimMap,
    mapkey,
    imap,
    imapkey,
    getClickableElements,
    vmapkey,
    map,
    unmap,
    unmapAllExcept,
    vmap,
    vunmap,
    cmap,
    addSearchAlias,
    removeSearchAlias,
    tabOpenLink,
    readText,
    Clipboard,
    Front,
    Hints,
    Visual,
    RUNTIME
} = api;

/*---------- DVORAK layout configuration ---------- */
//-- Navigation remaps
/* Show hints */
map('<Alt-h>', 'f'); // Show link hints. -- Hold <space> to hide hints

map('u', 't'); // Open URL

/* Tabs */
map('gt', 'T'); // Go to tab
map('<Alt-t>', 'E'); // Go one tab Left
map('<Alt-n>', 'R'); // Go one tab Right

map('<Alt-c>', 'S'); // Go back in history

/* Search key */
map('p', 's');
map('K', 'N'); // Previous found text
map('J', 'n'); // Next found text

vmap('sg', 'pg'); // Search selected with google

/* Scroll */
map('T', 'd'); // Scroll half down
map('N', 'e'); // Scroll half up
map('t', 'j'); // Scroll down
vmap('t', 'j');
map('n', 'k'); // Scroll up
vmap('n', 'k');
map('s', 'l'); // Scroll right
vmap('s', 'l');
map('H', '0'); // Scroll all the way to the left
vmap('H', '0');
map('S', '$'); // Scroll all the way to the right
vmap('S', '$');

map('R', 'r'); // Reload page
