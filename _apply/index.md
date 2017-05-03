---
title: Apply
permalink: /how-to-apply/
layout: docs
timeline:
  - title: 90 days before<br> the deadline
    description: Call for proposals (solicitation) released.
    steps:
      - step-1
  - title: 60 days before<br> the deadline
    steps:
      - step-2
      - step-3
      - step-4
  - title: "Deadline<br> {{ site.deadline }}"
    description: "Applications due by 5:00 PM in your local time zone."
    note: "Note: Your time zone is based on your company's address as you listed it in your application."
    deadline: true
  - title: 1-3 months after<br> the deadline
    description: Applications undergo panel and merit reviews.
  - title: 4-6 months after<br> the deadline
    description: We'll notify you weather your proposal is accepted or declined.
  - title: 5-6 months after<br> the deadline
    description: If your proposal is accepted, you'll receive funding of up to $225,000.
---
# How to apply

<ol class="timeline">
{% assign step_counter = 1 %}
{% for milestone in page.timeline %}
  <li {% if milestone.deadline %} class="step-deadline"{% endif %}>
    <span class="time">{{ milestone.title | liquify }}</span>
    <span class="time-description">
      {{ milestone.description }}
      {% if milestone.note %}<small>{{ milestone.note }}</small>{% endif %}
    </span>
    {% if milestone.steps %}
    <ol class="usa-accordion">
      {% for step in milestone.steps %}
      <li value="{{ step_counter }}" class="step">
        {% include components/accordion-item.html slug=step %}
      </li>
      {% assign step_counter = step_counter | plus: 1 %}
      {% endfor %}
    </ol>
    {% endif %}
  </li>
{% endfor %}
</ol>
