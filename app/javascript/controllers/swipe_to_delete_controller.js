import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe-to-delete"
export default class extends Controller {
  static targets = ["bin"]

  connect() {
    console.log("Swipe-to-delete controller connected!");
    this.isSwiping = false;
    this.startX = 0;
    this.startY = 0;
    this.currentX = 0;
  }

  start(event) {
    this.isSwiping = true;
    this.startX = event.touches ? event.touches[0].clientX : event.clientX;
    this.startY = event.touches ? event.touches[0].clientY : event.clientY;

    this.element.style.transition = "none";  // Disable transition while swiping
  }

  move(event) {
    if (this.isSwiping) {
      this.currentX = event.touches ? event.touches[0].clientX : event.clientX;
      const deltaX = this.startX - this.currentX;

      // Handle swipe left (to show delete icon)
      if (deltaX > 0) {
        requestAnimationFrame(() => {
          this.element.style.transform = `translateX(-${deltaX}px)`;
        });
      }

      // Handle swipe right (to hide delete icon)
      if (deltaX < 0) {
        requestAnimationFrame(() => {
          this.element.style.transform = `translateX(${Math.abs(deltaX)}px)`;
        });
      }
    }
  }

  end(event) {
    if (this.isSwiping) {
      const deltaX = this.startX - this.currentX;

      if (deltaX > 70) {
        this.swipeLeft();  // Show the bin if the swipe distance is large enough
      } else if (deltaX < -70) {
        this.swipeRight();  // Hide the bin if the swipe distance is large enough
      } else {
        this.resetSwipe();  // Reset if the swipe distance is not enough
      }

      this.element.style.transition = "transform 0.3s ease, opacity 0.3s ease";  // Enable transition back
      this.element.style.transform = '';  // Reset transform
      this.isSwiping = false;
    }
  }

  swipeLeft() {
    if (this.binTarget.classList.contains("d-none")) {
      this.binTarget.classList.remove("d-none");  // Show the bin
    }

    this.element.classList.add("swiped");  // Mark the item as swiped

    // Trigger the delete action after the swipe
    this.deleteItem();
  }

  swipeRight() {
    if (!this.binTarget.classList.contains("d-none")) {
      this.binTarget.classList.add("d-none");  // Hide the bin
    }

    this.element.classList.remove("swiped");  // Mark the item as not swiped
  }

  resetSwipe() {
    this.element.style.transform = '';  // Reset swipe position
  }

  async deleteItem() {
    const url = this.element.querySelector('a').href;
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

    try {
      const response = await fetch(url, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': csrfToken,
          'Accept': 'application/json',
        },
      });

      if (response.ok) {
        this.element.remove();  // If successful, remove the element from the DOM
      } else {
        console.error("Failed to delete item");
      }
    } catch (error) {
      console.error("Error during delete request:", error);
    }
  }

  handleLinkClick(event) {
    if (this.isSwiping) {
      event.preventDefault();
    }
  }
}





















// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="swipe-to-delete"
// export default class extends Controller {
//   static targets = ["bin"]

//   connect() {
//     console.log("Swipe-to-delete controller connected!");
//   }

//   start(event) {
//     this.isSwiping = true;
//     this.startX = event.touches ? event.touches[0].clientX : event.clientX;
//     this.startY = event.touches ? event.touches[0].clientY : event.clientY;

//     this.element.style.transition = "none";  // Disable transition while swiping
//   }

//   move(event) {
//     if (this.isSwiping) {
//       this.currentX = event.touches ? event.touches[0].clientX : event.clientX;
//       const deltaX = this.startX - this.currentX;

//       if (deltaX > 0) {  // If the user is swiping left
//         this.element.style.transform = `translateX(-${deltaX}px)`;
//       }
//     }
//   }

//   end(event) {
//     if (this.isSwiping) {
//       const deltaX = this.startX - this.currentX;

//       if (deltaX > 70) {
//         this.swipeLeft();  // Show the bin if the swipe distance is large enough
//       } else {
//         this.resetSwipe();  // Reset if the swipe distance is not enough
//       }

//       this.element.style.transition = "transform 0.3s ease, opacity 0.3s ease";  // Enable transition back
//       this.element.style.transform = '';  // Reset transform
//       this.isSwiping = false;
//     }
//   }

//   swipeLeft() {

//     this.binTarget.classList.toggle("d-none");

//     // If the bin is shown, mark the item as swiped
//     if (!this.binTarget.classList.contains("d-none")) {
//       this.element.classList.add("swiped");
//     }  // Show the bin icon
//   }

//   resetSwipe() {
//     this.element.style.transform = '';  // Reset swipe position
//   }

//   handleLinkClick(event) {
//   //   if (this.isSwiping) {
//   //     event.preventDefault();  // Prevent the navigation if a swipe is in progress
//   //   }
//   }
// }






// // import { Controller } from "@hotwired/stimulus"

// // // Connects to data-controller="swipe-to-delete"
// // export default class extends Controller {
// //   static targets = ["bin"]
// //   connect() {
// //     this.isSwiping = false;  // Track whether the user is swiping
// //   }

// //   start(event) {
// //     this.isSwiping = true;  // Mark as swiping
// //     this.startX = event.touches ? event.touches[0].clientX : event.clientX;
// //     this.startY = event.touches ? event.touches[0].clientY : event.clientY;

// //     // Disable transition for smoother dragging
// //     this.element.style.transition = "none";
// //   }

// //   move(event) {
// //     if (this.isSwiping) {
// //       this.currentX = event.touches ? event.touches[0].clientX : event.clientX;
// //       const deltaX = this.startX - this.currentX;

// //       // Apply the swipe transform only to the individual item being swiped
// //       if (deltaX > 0) {
// //         this.element.style.transform = `translateX(-${deltaX}px)`;
// //       }
// //     }
// //   }

// //   end(event) {
// //     if (this.isSwiping) {
// //       const deltaX = this.startX - this.currentX;

// //       // If the swipe distance is enough, trigger the delete action
// //       if (deltaX > 70) {
// //         this.swipeLeft();  // Show the bin if swipe is far enough
// //       } else {
// //         this.resetSwipe();  // Reset the item if not swiped enough
// //       }

// //       this.element.style.transition = "transform 0.3s ease, opacity 0.3s ease";  // Re-enable transition after swipe
// //       this.element.style.transform = '';  // Reset transform
// //       this.isSwiping = false;  // Reset swiping state
// //     }
// //   }

// //   swipeLeft() {
// //     // Toggle the visibility of the bin icon
// //     this.binTarget.classList.toggle("d-none");

// //     // If the bin is shown, mark the item as swiped
// //     if (!this.binTarget.classList.contains("d-none")) {
// //       this.element.classList.add("swiped");
// //     }
// //   }

// //   resetSwipe() {
// //     this.element.style.transform = '';  // Reset to original position
// //   }

// //   handleLinkClick(event) {
// //     // Prevent link navigation if the user is swiping
// //     if (this.isSwiping) {
// //       event.preventDefault();  // Prevent navigation during swipe
// //       console.log('Swipe in progress, preventing link navigation');
// //     }
// //   }
// // }
// //
