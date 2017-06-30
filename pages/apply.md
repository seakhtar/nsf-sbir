---
title: Apply
permalink: /apply/
layout: secondary-narrow
timeline:
  - title: 90 days before<br> the deadline
    description: Call for proposals (solicitation) released.
    steps:
      - step-1
      - step-2
  - title: 60 days before<br> the deadline
    steps:
      - step-3
      - step-4
      - step-5
      - step-6
  - title: "Deadline<br> {{ site.deadline }}"
    description: "Applications due by 5:00 p.m. in your local time zone."
    inactive_description: "Application submission has expired."
    note: "Note: Your time zone is based on your company's address as you listed it in your application."
    inactive_note:
    deadline: true
  - title: 1-3 months after<br> the deadline
    description: Applications undergo panel and merit reviews.
  - title: 4-6 months after<br> the deadline
    description: We'll notify you whether your proposal is accepted or declined.
  - title: 5-6 months after<br> the deadline
    description: If your proposal is accepted, you'll receive funding of up to $225,000.
---
<h1 class="page-title">How to apply</h1>

<p class="text-medium">
Learn about our recommended Phase I application timeline, how to prepare your proposal, and what to expect once you submit.
</p>

<ol class="timeline {% if site.app_process == "inactive" %} timeline-inactive {% endif %}">
{% assign step_counter = 1 %}
{% for milestone in page.timeline %}
  <li class="timeline-step{% if milestone.deadline %} timeline-step-deadline{% endif %}">
    {% if site.app_process == "active" %}
      {% assign milestone_description = milestone.description %}
      {% assign milestone_note = milestone.note %}
    {% else %}
      {% assign milestone_description = milestone.inactive_description %}
      {% assign milestone_note = milestone.inactive_note %}
    {% endif %}

    <span class="time">{{ milestone.title | liquify }}</span>
    <span class="time-description">
      {{ milestone_description }}
      {% if milestone_note %}<small>{{ milestone_note }}</small>{% endif %}
    </span>

    {% if milestone.steps %}
    <ol class="usa-accordion">
      {% for step in milestone.steps %}
      {% assign timeline_item_ = site.timeline | where:"slug", step %}
      <li value="{{ step_counter }}" class="step {{ step }} {% if site.app_process == "inactive" and timeline_item_[0].becomes_inactive == true %} step-inactive {% endif %}">
        {% include components/accordion-item.html slug=step %}
      </li>
      {% assign step_counter = step_counter | plus: 1 %}
      {% endfor %}
    </ol>
    {% endif %}
  </li>
{% endfor %}
</ol>
