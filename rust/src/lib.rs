use std::io::{Cursor};
use image::{ImageFormat};
use ::safer_ffi::prelude::*;
use base64::{Engine as _, engine::{general_purpose}};

// #[no_mangle]
// pub extern fn resizer_image(
//     data: *const u8,
//     data_size: usize,
//     width: u32,
//     height: u32,
//     quality: u8,
// ) -> *mut u8 {
//     let buffer = unsafe { std::slice::from_raw_parts(data, data_size) };
//     let img = image::load_from_memory_with_format(buffer, ImageFormat::Jpeg).unwrap();
//     let resized = img.resize_exact(width, height, image::imageops::FilterType::Lanczos3);
//     let mut output: Vec<u8> = Vec::new();
//     let format = image::ImageOutputFormat::Jpeg(quality);
//     resized.write_to(&mut output, format).unwrap();
//     let result_size = output.len();
//     let result = output.as_mut_ptr();
//     std::mem::forget(output);
//     std::mem::forget(img);
//     std::mem::forget(resized);
//     std::mem::forget(buffer);
//     std::mem::forget(data_size);
//     result
// }
#[ffi_export]
pub extern fn resize_image(base64_data: *const libc::c_char, width: u32, height: u32) -> *mut u8 {
    let cstr = unsafe { std::ffi::CStr::from_ptr(base64_data) };
    let base64_str = cstr.to_str().unwrap();
    let decoded_data = general_purpose::STANDARD
        .decode(base64_str).unwrap();
    let cursor = Cursor::new(decoded_data);
    let img = image::load(cursor, ImageFormat::Png).unwrap();
    let mut resized_img = image::imageops::resize(&img, width, height, image::imageops::FilterType::Triangle);
    // let mut out_data = Vec::new();
    // resized_img.write_to(&mut out_data, ImageFormat::Png).unwrap();
    // let out_len = out_data.len();
    // let out_ptr = out_data.as_mut_ptr();
    let out_ptr = resized_img.as_mut_ptr();
    // std::mem::forget(out_data);
    std::mem::forget(resized_img);
    std::mem::forget(img);
    out_ptr
}

pub fn add(left: usize, right: usize) -> usize {
    left + right
}

/// The following test function is necessary for the header generation.
#[::safer_ffi::cfg_headers]
#[test]
fn generate_headers() -> ::std::io::Result<()> {
    ::safer_ffi::headers::builder()
        .to_file("header/resizer_image.h")?
        .generate()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
