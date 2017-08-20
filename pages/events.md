---
title: Events
calendar-title: Annual events
permalink: /events/
layout: secondary
---


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
    <p></p>
    {% endif %}

<section class="section-background-image">
<div class="usa-section-tight-top usa-content">
<div class="usa-grid" markdown="1">

## Annual events

Lorem ipsum dolor sit amet consecteteur quid adipiscing nonummy. Sagittis tempor morbi maecenas curabitur quam venenatis, vulputate hendrerit egestas nec netus mattis himenaeos, pellentesque felis platea montes mus.

{% include annual-events.html %}

</div>
</div>
</section>



<!--
You can often find us at major tradeshows and events throughout the year.  Here's a representation of events we've attended or plan on attending in 2017:

### January
[CES](https://www.ces.tech/)
### March
[SXSW](https://www.sxsw.com/)
### April
[ACA Summit](https://www.angelcapitalassociation.org/)
### May
National SBIR Conference
### June
[ISTE](https://www.iste.org/)  
[BIO International Convention](https://convention.bio.org/home.aspx)  
[Phase II SBIR Conference](https://www.nsfiipconf.com/2017sbirp2/)  
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)  
### July
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)  
[New York Venture Summit](https://www.youngstartup.com/newyork2017/overview.php)  
[SEMICON West](https://www.semiconwest.org/)  
### September
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)
### October
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)  
[SynBioBeta](https://synbiobeta.com/)  
[Black Enterprise - TechConnext Summit](https://www.blackenterprise.com/events/techconnext/)  
[SOCAP](https://socialcapitalmarkets.net/)  
[EmTech](https://events.technologyreview.com/emtech/16/)    -->
