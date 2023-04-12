import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  like(event) {
    event.preventDefault()
    const id = event.currentTarget.dataset.id
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/api/movies/${id}/like`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({
        authenticity_token: csrfToken,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        const { likes, dislikes } = data
        this._calculateLikesCount(id, likes, dislikes)
      })
  }

  dislike(event) {
    event.preventDefault()
    const id = event.currentTarget.dataset.id
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    fetch(`/api/movies/${id}/dislike`, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({
        authenticity_token: csrfToken,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        const { likes, dislikes } = data
        this._calculateLikesCount(id, likes, dislikes)
      })
  }

  _calculateLikesCount(id, likes, dislikes) {
    const likesCount = document.getElementById(`like-movie-${id}`)
    const dislikesCount = document.getElementById(`dislike-movie-${id}`)
    likesCount.innerText = likes
    dislikesCount.innerText = dislikes
  }
}
