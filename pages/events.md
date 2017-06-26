---
title: Events
permalink: /events/
layout: secondary-narrow
---

# Events

Helpful information for applicants and awardees on upcoming events.

<table class="usa-table-borderless event-listing">
    <thead>
      <tr>
        <th scope="col">Date/time</th>
        <th scope="col">Event type</th>
        <th scope="col">Details</th>
      </tr>
    </thead>
    <tbody>

    {% assign day_today = site.time | date: "%Y%m%d" %}
    {% for event in site.events reversed %}
    {% assign event_date = event.date | date: "%Y%m%d" %}
      {% if event_date >= day_today%}

        <tr>
        {{event_date}} | {{day_today}}
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
        {% endif %}
        {% endfor %}
    </tbody>
</table>


