import Swal from 'sweetalert2'

export const swal =
  ({ title, text }) =>
  () =>
    Swal.fire({
      icon: 'error',
      title,
      text,
    })
