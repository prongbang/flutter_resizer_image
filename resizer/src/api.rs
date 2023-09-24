use base64::{Engine};
use image::io::Reader as ImageReader;
use std::io::{Cursor, Write};
use std::num::NonZeroU32;
use base64::engine::general_purpose;
use fast_image_resize as fr;
use image::codecs::png::PngEncoder;
use image::{ColorType, ImageEncoder, ImageFormat};

pub fn add(left: i8, right: i8) -> i8 {
    left + right
}

pub fn resizer(image: String, width: u32, height: u32, percent: u32) -> Vec<u8> {
    let base64_image = image.as_str();

    // Decode the base64 image to binary
    let binary_image = general_purpose::STANDARD.decode(base64_image).unwrap();

    // Create a cursor from the binary data
    let cursor = Cursor::new(binary_image);

    // Create an image reader from the cursor
    let image_reader = ImageReader::with_format(cursor, ImageFormat::Png);

    // Read the image from the reader
    let images = image_reader.decode().unwrap();
    println!("Image dimensions: {}x{}", images.width(), images.height());

    // Create source image
    let src_w = images.width();
    let src_h = images.height();
    let w = NonZeroU32::new(src_w.clone()).unwrap();
    let h = NonZeroU32::new(src_h.clone()).unwrap();
    let src_image = fr::Image::from_vec_u8(
        w,
        h,
        images.to_rgba8().into_raw(),
        fr::PixelType::U8x4,
    ).unwrap();

    // Create container for data of destination image
    let mut dst_w = width;
    let mut dst_h = height;
    if percent > 0 {
        let percent_w = calc_percent(&src_w, &percent);
        let percent_h = calc_percent(&src_h, &percent);
        dst_w = calc_dif(&src_w, &percent_w);
        dst_h = calc_dif(&src_h, &percent_h);
    }
    let dst_width = NonZeroU32::new(dst_w).unwrap();
    let dst_height = NonZeroU32::new(dst_h).unwrap();

    let mut dst_image = fr::Image::new(dst_width, dst_height, src_image.pixel_type());

    // Get mutable view of destination image data
    let mut dst_view = dst_image.view_mut();

    // Create Resizer instance and resize source image into buffer of destination image
    let mut resizer = fr::Resizer::new(
        fr::ResizeAlg::Nearest,
    );
    resizer.resize(&src_image.view(), &mut dst_view).unwrap();

    // Write destination image as PNG-file
    let mut png_buffer = Vec::new();
    PngEncoder::new(png_buffer.by_ref())
        .write_image(
            dst_image.buffer(),
            dst_width.get(),
            dst_height.get(),
            ColorType::Rgba8,
        ).expect("Error encoding pixels as PNG");

    return png_buffer.into();
}

fn calc_dif(org: &u32, dif: &u32) -> u32 {
    org - dif
}

fn calc_percent(size: &u32, percent: &u32) -> u32 {
    size * percent / 100
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
