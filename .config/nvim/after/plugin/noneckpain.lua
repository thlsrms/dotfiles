local NoNeckPain = require('no-neck-pain')

NoNeckPain.bufferOptions = {
    enabled = false,
}

NoNeckPain.setup({
    width = 120,
    minSideBufferWidth = 0,
    autocmds = {
        enableOnVimEnter = false,
    }
})
