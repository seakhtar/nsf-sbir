---
title: Resources and events
permalink: /events/
layout: secondary-narrow
---

# Resources and events

Advice from our program staff, event information, FAQ, and more.

## America's Seed Fund on Medium

Get program updates and the latest from our staff on [Medium](https://medium.com/@NSFSBIR).

## Q&A webinars

Ask all your application-related questions during our Q&A webinars. Can’t make it to a webinar? Check out our videos covering [program basics](https://www.youtube.com/watch?v=1Tm_ToVRpqE) and [what you need to know before applying](https://www.youtube.com/watch?v=-0lhmfczIJ8&feature=youtu.be). (We offer a [PDF version of program basics](https://www.nsf.gov/eng/iip/sbir/documents/About_NSF_SBIR_STTR.pdf), too.)

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
  
  ## Onsite events
  
  Our mentors and staff attend events year round and across the country. Here are just a few events we’ll be visiting:
  
  - [SxSW](http://schedule.sxsw.com/2017/events/OE06311)
  - [CES](http://www.ces.tech/)
  - [SBIR Road Tour](http://www.sbirroadtour.com/)
  
  Before you register, please double-check event dates and times with the sponsoring organizations.
  
  ## FAQ
  
Still have questions? Visit our [FAQ](https://www.nsf.gov/pubs/2017/nsf17071/nsf17071.jsp), which covers the pre-application process to post-award reporting (and everything in between).

## Awardee profile videos

Get to know our awardees better — we’ve got [video profiles of funded startups and small businesses](https://www.youtube.com/playlist?list=PLGhBP1C7iCOkPp8yv2I3ZGk16LiMIiikb), along with [profiles of funded startup partnerships](https://www.youtube.com/playlist?list=PLGhBP1C7iCOkmWtgG1BKTZpfMMCDkYY61).

## Forms for Phase I management

### [SBIR/STTR Funding Agreement Certification (PDF)](/files/SBIR_STTR_Funding_Agreement.pdf) 
SBIR/STTR prospective grantees will be notified by NSF to provide this form to determine whether the business is eligible for a Small Business Innovation Research (SBIR) Program award. Certification will be used to ensure continued compliance during the life of the funding agreement.

### [Certificate of Current Cost or Pricing Data (Word doc)](/files/Certificate_of_Current_Cost.docx)
Certification that cost and pricing data are accurate; used to ensure continued compliance during the life of the funding agreement.

### [SBIR/STTR Phase I Report Cover Page (PDF) ](/files/SBIR-STTR_Revised_Report_Cover.pdf)
All SBIR/STTR Phase I and Phase II awardees must complete this certification at all times set forth in the funding agreement. This includes checking all of the boxes and having an authorized officer of the awardee sign and date the certification each time it is requested.

## Forms for Phase II application and management

### [Company Commercialization History (XLS)](/files/CommercialHistoryTemplate.xls) 
Phase II grantees need to submit this form if they have ever received an SBIR or STTR Phase II award from any agency, including NSF.

### [Blank Milestone Chart (XLSX) ](/files/Blank_Milestone_Chart.xlsx)
Phase II grantees need to submit this form to show duration and expenditures of their current project.

### [SBIR/STTR Funding Agreement Certification (PDF)](/files/SBIR_STTR_Funding_Agreement.pdf) 
SBIR/STTR prospective grantees will be notified by NSF to provide this form to determine whether the business is eligible for a Small Business Innovation Research (SBIR) Program award. Certification will be used to ensure continued compliance during the life of the funding agreement.

### [Certificate of Current Cost or Pricing Data (Word doc)](/files/Certificate_of_Current_Cost.docx) 
Certification that cost and pricing data are accurate; used to ensure continued compliance during the life of the funding agreement.

### [SBIR/STTR Phase II Report Cover Page (PDF) ](/files/SBIR-STTR_Revised_Report_Cover.pdf)
All SBIR/STTR Phase I and Phase II awardees must complete this certification at all times set forth in the funding agreement. This includes checking all of the boxes and having an authorized officer of the awardee sign and date the certification each time it is requested.

### [SBIR/STTR Phase II Administrative and Financial Review video](https://www.youtube.com/playlist?list=PLGhBP1C7iCOmI1p5UtqYCXzmUL9SzSApv)

