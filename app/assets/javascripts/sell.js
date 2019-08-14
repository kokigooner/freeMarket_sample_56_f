document.addEventListener('DOMContentLoaded', function () {
  var
    sellbox = document.getElementById('sellbox'),
    output = document.getElementById('output'),
    fileInput = document.getElementById('fileinput'),
    maxSize = 20 * 1024 * 1024;

  function organizeFiles(files) {
    var
      length = files.length,
      i = 0, file;

    for (; i < length; i++) {
      file = files[i];

      if (!file || file.type.indexOf('image/') < 0) {
        continue;
      }

      if (file.size > maxSize) {
        continue;
      }
      outputImage(file);
    }
  }

  function outputImage(blob) {
    var
      image = new Image(),
      blobURL = URL.createObjectURL(blob);

    image.src = blobURL;
    image.addEventListener('load', function () {
      URL.revokeObjectURL(blobURL);
      output.appendChild(image);
    });
  }

  if (sellbox === true) {
    sellbox.addEventListener('dragover', function (ev) {
      ev.preventDefault();
      ev.dataTransfer.dropEffect = 'copy';
      sellbox.classList.add('dragover');
    });

    sellbox.addEventListener('dragleave', function () {
      sellbox.classList.remove('dragover');
    });

    sellbox.addEventListener('drop', function (ev) {
      ev.preventDefault();
      sellbox.classList.remove('dragover');
      output.textContent = '';
      organizeFiles(ev.dataTransfer.files);
    });

    sellbox.addEventListener('click', function () {
      fileInput.click();
    });
  }

  if (fileInput === true) {
    fileInput.addEventListener('change', function (ev) {
      output.textContent = '';
      organizeFiles(ev.target.files);
      fileInput.value = '';
    });
  }
});