import "bootstrap";
import { previewImageOnFileSelect } from "plugins/preview_images.js";

if (document.getElementById('browse')) {
  previewImageOnFileSelect();
};
