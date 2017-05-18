---
title: Events
permalink: /events/

layout: docs
---

# Events

There are several SBIR/STTR events every month, including webinsars, conferences, tradeshows, and presentations.

## Webinars

*Yay*
**Yay** 
*_Yay_* 

<p class="usa-font-lead">Our onsite and online events will help you learn about our program and connect with program staff.</p>

<table class="usa-table-borderless event-listing">
    <thead>
      <tr>
        <th scope="col">Date/time</th>
        <th scope="col">Event type</th>
        <th scope="col">Details</th>
      </tr>
    </thead>
    <tbody>

    {% for event in site.events reversed %}
      <tr>
        <td width="20%">{{event.date | date: "%B %-d, %Y" }}<br>
        {{event.timeStart}} - {{event.timeEnd}}</td>
        <td width="20%">{{event.eventType}}</td>
        <td><span class="event-title">{{event.title}}</span>
        <span class="event-description">{{event.description}}</span>
        {% if event.registrationLink %}
          <a class="usa-button" href="{{ event.registrationLink }}">Register</a>
        {% endif %}
        {% if event.moreInfoLink %}
          {{ event.moreInfoLink }}
        {% endif %}
        </td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
