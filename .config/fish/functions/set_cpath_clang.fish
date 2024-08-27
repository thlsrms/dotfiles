function set_cpath_clang
    set -gx CPATH "$(clang -print-resource-dir)/include"
end
