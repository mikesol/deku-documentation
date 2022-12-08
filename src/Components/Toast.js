import Toastify from 'toastify-js'
import 'toastify-js/src/toastify.css'

export const toast = (s) => () =>
  Toastify({
    text: s,
    duration: 1500,
    gravity: 'bottom', // `top` or `bottom`
    position: 'right', // `left`, `center` or `right`
    //stopOnFocus: true, // Prevents dismissing of toast on hover
    // style: {
    //   background: "linear-gradient(to right, #00b09b, #96c93d)",
    // },
    // onClick: function(){} // Callback after click
  }).showToast()
