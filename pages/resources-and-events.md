---
title: Resources and events
permalink: /resources-and-events/
layout: secondary-narrow
---

# Resources and events

Helpful information for applicants and awardees.

## For applicants

{% if site.app_process == "active" %}
### Q&A webinars

Thinking of applying for Phase I funding? Ask all your application-related questions during our Q&A webinars. Can’t make it to a webinar? Check out our videos covering [program basics](https://www.youtube.com/watch?v=1Tm_ToVRpqE) and [what you need to know before applying](https://www.youtube.com/watch?v=-0lhmfczIJ8&feature=youtu.be). (We offer a [PDF version of program basics](https://www.nsf.gov/eng/iip/sbir/documents/About_NSF_SBIR_STTR.pdf), too.)

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
{% else %}
### Q&A videos

Thinking of applying for Phase I funding? Check out our videos covering [program basics](https://www.youtube.com/watch?v=1Tm_ToVRpqE) and [what you need to know before applying](https://www.youtube.com/watch?v=-0lhmfczIJ8&feature=youtu.be). (We offer a [PDF version of program basics](https://www.nsf.gov/eng/iip/sbir/documents/About_NSF_SBIR_STTR.pdf), too.) 
{% endif %}

### Startup and partnership profiles

Get to know our awardees better — we’ve got [video profiles of funded startups and small businesses](https://www.youtube.com/playlist?list=PLGhBP1C7iCOkPp8yv2I3ZGk16LiMIiikb), along with [profiles of funded startup partnerships](https://www.youtube.com/playlist?list=PLGhBP1C7iCOkmWtgG1BKTZpfMMCDkYY61).

## General resources

### Spreading the word

As an awardee or alum, you’re the face of our program, and we hope you’ll share news of your successes for years to come. Our [Ambassadors page](https://www.nsf.gov/eng/iip/sbir/ambassador.jsp) offers tips for doing just that.

### Research experiences

Are you a teacher or student who’s interested in research experiences and partnerships with Phase II awardees? Visit our [Research Experiences page](https://www.nsf.gov/eng/iip/sbir/portfolio/researchexp.jsp) to learn more about how you can partner with funded Phase II companies.

### Award-management forms

Our [Forms page]({{ '/awardees/forms/' | relative_url }}) has all the forms you need to manage your Phase I or Phase II award or apply for a Phase II award.

## FAQ

Have lingering questions? Visit our [FAQ](https://www.nsf.gov/pubs/2017/nsf17071/nsf17071.jsp), which covers the pre-application process to post-award reporting (and everything in between).
