const changeHeaderOnScroll = (evt) => {
  let headerElm = document.getElementById("header");
  const doc = document.documentElement;
  const top = (window.pageYOffset || doc.scrollTop)  - (doc.clientTop || 0);
  if(top > 100){
    headerElm.classList.add("header-scrolled");
  }else {
    headerElm.classList.remove("header-scrolled");
  }
}

const closeMenuOnOverlayClick = () => {
  const overlay = document.getElementsByClassName("menu-overlay")[0];
  const body = document.getElementsByTagName('body')[0];
  const nav = document.getElementById("hamburger");
  nav.checked = false;
  body.classList.remove("nav-open");
  overlay.classList.add("hide");
}

export const toggleNavMenu = () => {
  const nav = document.getElementById("hamburger");
  const overlay = document.getElementsByClassName("menu-overlay")[0];
  const body = document.getElementsByTagName('body')[0];
  if(!nav.checked) {
    body.classList.add("nav-open");
    overlay.classList.remove("hide");
    overlay.addEventListener('click', closeMenuOnOverlayClick);
  } else {
    body.classList.remove("nav-open");
    overlay.classList.add("hide");
    overlay.removeEventListener('click', closeMenuOnOverlayClick);
  }
}

const addClassOnHeaderOnScroll = () => {
  window.onscroll = changeHeaderOnScroll
}

export const common = () => {
  window.requestAnimationFrame(() => {
    addClassOnHeaderOnScroll();
  });
}
