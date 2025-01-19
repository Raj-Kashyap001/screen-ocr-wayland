# Screen OCR Wayland

Screen OCR Wayland is a tool designed to capture and extract text from your screen on Wayland display servers. This tool leverages OCR (Optical Character Recognition) technology to convert images of text into machine-encoded text.

## Features

- Capture screenshots on Wayland display servers
- Extract text from screenshots using OCR
- Support for multiple languages
- Easy to use command-line interface

## Installation

### Dependencies
- grim
- tesseract
- tesseract-data-eng 

To install Screen OCR Wayland, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/screen-ocr-wayland.git
    ```
2. Navigate to the project directory:
    ```sh
    cd screen-ocr-wayland
    ```
3. Install the required dependencies:

#### Debian-based distributions (e.g., Ubuntu)
    ```sh
    sudo apt-get install grim tesseract-ocr tesseract-ocr-eng
    ```

#### Arch-based distributions
    ```sh
    sudo pacman -S grim tesseract tesseract-data-eng
    ```

#### Red Hat-based distributions (e.g., Fedora)
    ```sh
    sudo dnf install grim tesseract tesseract-langpack-eng
    ```

## Usage

To use Screen OCR Wayland, run the following command:

```sh
./screen-ocr-wayland
```

## Contributing

We welcome contributions! 

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Wayland](https://wayland.freedesktop.org/)
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract)

## Contact

For any questions or feedback, please open an issue on GitHub or contact us at support@example.com.
