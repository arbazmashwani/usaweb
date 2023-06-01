document.addEventListener('contextmenu', (event) => {
    event.preventDefault();
  });
  
  document.addEventListener('mousedown', (event) => {
    if (event.button === 2) {
      event.preventDefault();
    }
  });
  
  document.addEventListener('keydown', (event) => {
    if (event.keyCode === 83 && (event.ctrlKey || event.metaKey)) {
      event.preventDefault();
    }
  });