---
title: Events
permalink: /events/
layout: secondary-narrow
---

# Events

Helpful information for applicants and awardees on upcoming events.

{% assign current_events = ',' | split: "," %}
{% assign day_today = site.time | date: "%Y%m%d" %}
{% for event in site.events %}
{% assign event_date = event.date | date: "%Y%m%d" %}
  {% if event_date >= day_today %}
    {% assign current_events = current_events | push: event %}
  {% endif %}
{% endfor %}

{% if current_events.size > 0 %}
<table class="usa-table-borderless event-listing">
    <thead>
      <tr>
        <th scope="col">Date/time</th>
        <th scope="col">Details</th>
      </tr>
    </thead>
    <tbody>

    {% for event in current_events %}

        <tr>
          <td width="20%">{{event.date | date: "%B %-d, %Y" }}<br>
            {{event.timeStart}} - {{event.timeEnd}}</td>
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
{% else %}
<p>We don't currently have any events scheduled — check back soon for the latest updates.</p>
{% endif %}
