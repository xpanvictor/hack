use std::path::Path;

pub fn get_file_name(file_name: &Path) -> String {
    file_name.parent().unwrap().join(file_name.file_stem().unwrap()).to_str().unwrap().into()
}
