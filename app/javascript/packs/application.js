import "bootstrap";
import { previewImageOnFileSelect } from "plugins/preview_image.js";

if (document.getElementById('browse')) {
  previewImageOnFileSelect();
};
