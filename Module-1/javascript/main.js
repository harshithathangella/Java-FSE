// Sample event data
const events = [
  {
    id: 1,
    name: "Jazz Night",
    date: new Date(2025, 5, 15),
    seats: 10,
    category: "Music",
    location: "Community Hall",
  },
  {
    id: 2,
    name: "Football Tournament",
    date: new Date(2025, 6, 1),
    seats: 5,
    category: "Sports",
    location: "City Stadium",
  },
  {
    id: 3,
    name: "Rock Concert",
    date: new Date(2025, 5, 25),
    seats: 25,
    category: "Music",
    location: "Open Arena",
  },
];

// DOM elements
const container = document.getElementById("events-container");
const categoryFilter = document.getElementById("category-filter");
const searchInput = document.getElementById("search");

// Render events function
function renderEvents(eventList) {
  container.innerHTML = "";
  if (!eventList.length) {
    container.innerHTML = `<p style="color:#ffd700; font-weight:600;">No events found.</p>`;
    return;
  }

  eventList.forEach((event) => {
    // Only upcoming events with seats
    const now = new Date();
    if (event.date < now || event.seats <= 0) return;

    const card = document.createElement("div");
    card.className = "event-card";

    card.innerHTML = `
      <h3>${event.name}</h3>
      <p class="event-info">Date: ${event.date.toDateString()}</p>
      <p class="event-info">Seats left: ${event.seats}</p>
      <p class="event-info">Category: ${event.category}</p>
      <p class="event-info">Location: ${event.location}</p>
    `;

    const registerBtn = document.createElement("button");
    registerBtn.className = "register-btn";
    registerBtn.textContent = "Register";
    registerBtn.onclick = () => {
      const encodedName = encodeURIComponent(event.name);
      window.location.href = `register.html?event=${encodedName}`;
    };

    card.appendChild(registerBtn);
    container.appendChild(card);
  });
}

// Filter events based on category & search term
function filterEvents() {
  const category = categoryFilter.value;
  const searchTerm = searchInput.value.toLowerCase();

  let filtered = events;

  if (category !== "all") {
    filtered = filtered.filter((e) => e.category === category);
  }

  if (searchTerm) {
    filtered = filtered.filter((e) => e.name.toLowerCase().includes(searchTerm));
  }

  renderEvents(filtered);
}

// Initial render
renderEvents(events);

// Event listeners for filters
categoryFilter.addEventListener("change", filterEvents);
searchInput.addEventListener("input", filterEvents);
