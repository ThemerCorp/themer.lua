" Javacafe Theme
lua << EOF
package.loaded['base-16'] = nil
package.loaded['base-16.functions'] = nil
package.loaded['base-16.theme'] = nil
package.loaded['base-16.util'] = nil

require("base-16").load("javacafe", true)
EOF
