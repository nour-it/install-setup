echo "$(date)---------------" >> log

source_fonts="./fonts"
tmp="$source_fonts/tmp"
tmp2="$source_fonts/tmp2"
rm -rf "${source_fonts}/tmp" "${source_fonts}/tmp2"
mkdir -p "${tmp}" "${tmp2}"
destination_folder="${source_fonts}"
pattern="*.ttf"

# Loop through each file in the folder
for font_archive in "$source_fonts"/*; do
    # Check if the file is a regular file (not a directory)

    # Check if the archive exists
    if [ -f "$font_archive" ]; then
        arvhice_file=$(basename "$font_archive")
        archive_name="${arvhice_file%.*}"
        font_dir="/usr/share/fonts/$archive_name"
        # Create the destination folder if it doesn't exist
        # Extract the archive
        # tar -xzf "$archive_path" -C "$destination_folder" --quiet
        unzip -o -q "$font_archive" -d "${tmp}/$archive_name"

        echo "$archive_name Extraction complete."  >> log

        source_dir="${tmp}/$archive_name"
        destination_dir="${tmp2}/$archive_name"
        mkdir -p "${destination_dir}"
        find "$source_dir" -type f -name "$pattern" -exec sudo cp {} "$destination_dir" \;

        
        sudo rm -rf "${font_dir}"
        sudo mkdir -p "${font_dir}"
        source_dir="${tmp2}/$archive_name"
        destination_dir="${font_dir}"
        find "$source_dir" -type f -name "$pattern" -exec sudo cp {} "$destination_dir" \;

    else
        echo "$font_archive Error: Archive not found at $font_archive"  >> log
    fi

done

rm -rf "${tmp}" "${tmp2}"
fc-cache -vf

echo "done---------------" >> log