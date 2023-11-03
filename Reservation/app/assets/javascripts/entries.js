document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('a[data-remote]').forEach((link) => {
    link.addEventListener('ajax:success', () => {
      link.closest('tr').remove()
    })
  })
})
