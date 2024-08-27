function search_replace -d 'Search and replace for text in files :\"search_replace directory old_text new_replacement\"' \
    -a directory pattern new
    if test (count $argv) -gt 2
        # search_replace directory old_string new_string
        echo "Replacing '$pattern' with '$new' for all files in $directory."
        set -l file_list (fd . "$directory" -t file)
        for f in $file_list
            echo $f
            sed -i "s/$pattern/$new/g" $f
        end
    end
end
