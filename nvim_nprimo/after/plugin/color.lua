vim.g.disable_background = true

function ColorMyPencils(color)
    color = color or "base16-tomorrow-night-eighties"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
