document.addEventListener('DOMContentLoaded', function () {
  const menuIcon = document.querySelector('.menu-icon');
  const menu = document.querySelector('.menu-navegacao');

  if (menuIcon && menu) {
    menuIcon.addEventListener('click', () => {
      menu.classList.toggle('ativo');
    });
  } else {
    console.error("Menu ou ícone não encontrado");
  }
});
