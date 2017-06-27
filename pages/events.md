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

# Annual Events
You can often find us at major tradeshows and events throughout the year.  Here's a representation of events we've attended in the past: 

## January
[CES](https://www.ces.tech/) 
## March
[SXSW](https://www.sxsw.com/)
## April
[ACA Summit](https://www.angelcapitalassociation.org/)
## May
National SBIR Conference
## June
[ISTE](https://www.iste.org/)  
[BIO International Convention](https://convention.bio.org/home.aspx)  
[Phase II SBIR Conference](https://www.nsfiipconf.com/2017sbirp2/)  
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)  
## July
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)  
[New York Venture Summit](https://www.youngstartup.com/newyork2017/overview.php)  
[SEMICON West](https://www.semiconwest.org/)  
## September
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)
## October
[SBIR Road Tour](https://www.sbirroadtour.com/dates.php#)  
[SymBioBeta](https://synbiobeta.com/)  
[Black Enterprise - TechConnext Summit](https://www.blackenterprise.com/events/techconnext/)  
[SOCAP](https://socialcapitalmarkets.net/)  
[EmTech](https://events.technologyreview.com/emtech/16/)  


