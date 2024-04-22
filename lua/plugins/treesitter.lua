require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "cpp", "c_sharp", "java", "go", "kotlin", "lua", "python",
        "javascript", "typescript",
        "sql",
        "html", "css", "csv", "json", "xml", "yaml",
        "gitignore",
        "dockerfile",
        "matlab"
    },
    auto_install = "true",
    highlight = {
        enable = true,
    }
}
