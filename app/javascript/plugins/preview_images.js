const previewFiles = () => {
  const preview = document.getElementById('preview');
  const files   = document.getElementById('browse').files;

  const readAndPreview = (file) => {
    const reader = new FileReader();
    reader.addEventListener("load", (e) => {
      // console.log(e.currentTarget.result)
      const image = new Image(150);
      image.src = e.currentTarget.result;
      image.class = 'preview_image'
      console.log(image)
      preview.appendChild(image);
    }, false);
    reader.readAsDataURL(file);
  }

  if (files) {
    [].forEach.call(files, readAndPreview);
  }
}

const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('browse');
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      previewFiles();
    })
  }
}

export { previewImageOnFileSelect };
