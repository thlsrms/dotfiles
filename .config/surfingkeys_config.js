// Surfingkeys extension config file 
// ----
// Web Browser extension to navigate the web using VIM-like keybindings
// ----

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

//-- Navigation remaps
/* Show hints */
map('u', 'f'); // Show link hints. -- Hold <space> to hide hints
Hints.setCharacters("aoeuidhtnsqjkxb");
settings.hintShiftNonActive = true;

mapkey('gO', '#8Open an URL in current tab', function() {
    Front.openOmnibar({ type: "URLs", extra: "getTopSites", tabbed: false });
});

mapkey('T', 'Choose a tab', function() {
    Front.openOmnibar({ type: "Tabs" });
})
