import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  register(event) {
    event.preventDefault()
    const username = document.getElementById('user_username').value
    const password = document.getElementById('user_password').value
    const password_confirmation = password
    const data = {
      user: {
        username: username,
        password: password,
        password_confirmation: password_confirmation,
      },
    }
    const url = '/users'
    const method = 'POST'
    const headers = {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
    }
    const body = JSON.stringify(data)
    const config = {
      method: method,
      headers: headers,
      body: body,
    }
    fetch(url, config)
      .then((response) => response.json())
      .then((data) => {
        console.log(data)
      })
      .catch((error) => {
        console.error('Error:', error)
      })
      .finally(() => {
        location.reload()
      })
  }
}
