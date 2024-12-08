import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // Define which elements we want to target with data-passenger-form-target
  static targets = ["container", "template"]

  // Called when controller connects to the DOM
  connect() {
    console.log("Passenger form controller connected!")
  }

  // Called when "Add Passenger" button is clicked
  addPassenger() {
    console.log("Add passenger clicked!")
    // Count existing passengers and add 1 for the new one
    const passengerCount = this.containerTarget.children.length + 1
    
    // Get the HTML template content
    const template = this.templateTarget.innerHTML
    
    // Replace {index} in the template with actual index (zero-based for Rails)
    // Example: booking[passengers_attributes][0][name]
    const newPassengerHtml = template.replace(/{index}/g, passengerCount - 1)
    
    // Create a temporary container to hold the new HTML
    const tempContainer = document.createElement('div')
    tempContainer.innerHTML = newPassengerHtml
    
    // Update the heading to show correct passenger number (one-based for display)
    // Example: "Passenger 2"
    const heading = tempContainer.querySelector('h5')
    heading.textContent = `Passenger ${passengerCount}`
    
    // Add the new passenger form to the page
    this.containerTarget.appendChild(tempContainer.firstElementChild)
  }

  // Called when "Remove" button is clicked
  removePassenger(event) {
    // Prevent removing the last passenger
    if (this.containerTarget.children.length > 1) {
      // Find and remove the passenger card that contains the clicked button
      const passengerCard = event.target.closest('.card')
      passengerCard.remove()
      
      // Update the numbering of remaining passengers
      this.updatePassengerNumbers()
    }
  }

  // Helper method to fix passenger numbers after removal
  updatePassengerNumbers() {
    // Loop through all passenger cards
    this.containerTarget.querySelectorAll('.card').forEach((card, index) => {
      // Update the visible passenger number
      const heading = card.querySelector('h5')
      heading.textContent = `Passenger ${index + 1}`
      
      // Update the input field names to have sequential indices
      // Example: booking[passengers_attributes][0][name] becomes
      //         booking[passengers_attributes][1][name] etc.
      card.querySelectorAll('input').forEach(input => {
        const name = input.getAttribute('name')
        if (name) {
          input.setAttribute('name', name.replace(/\[\d+\]/, `[${index}]`))
        }
      })
    })
  }
}