import { Controller } from "stimulus"
import consumer from '../channels/consumer'

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
    connect() {
    // consumer.subscriptions.create(
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (message) => {
        this.element.insertAdjacentHTML('beforeend', message)
        this.element.scrollTop = this.element.scrollHeight
      }}
    )
  }


  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
  // #insertMessageAndScrollDown(message) {
  //   // Logic to know if the sender is the current_user
  //   const currentUserIsSender = this.currentUserIdValue === message.sender_id

  //   #buildMessageElement(currentUserIsSender, message) {
  //     return `
  //       <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
  //         <div class="${this.#userStyleClass(currentUserIsSender)}">
  //           ${message}
  //         </div>
  //       </div>
  //     `
  //   }
  // }
}
