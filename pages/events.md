---
title: Resources and events
permalink: /events/
layout: secondary-narrow
---

# Resources and events

Helpful information for applicants and awardees.

## For applicants

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


### Onsite events

Our mentors and staff attend events year round and across the country; attending these events is a great way to learn more about the program, our companies’ accomplishments, and the application process. Here are just a few events we’ll be visiting:

  - [SxSW](http://schedule.sxsw.com/2017/events/OE06311)
  - [CES](http://www.ces.tech/)
  - [SBIR Road Tour](http://www.sbirroadtour.com/)

  Before you register, please double-check event dates and times with the sponsoring organizations.

### Video profiles

Get to know our awardees better — we’ve got [video profiles of funded startups and small businesses](https://www.youtube.com/playlist?list=PLGhBP1C7iCOkPp8yv2I3ZGk16LiMIiikb), along with [profiles of funded startup partnerships](https://www.youtube.com/playlist?list=PLGhBP1C7iCOkmWtgG1BKTZpfMMCDkYY61).

## For Phase I awardees

### Forms to manage Phase I funding

[SBIR/STTR Funding Agreement Certification (PDF)]({{ site.baseurl }}/assets/files/grantee-files/SBIR_STTR_Funding_Agreement.pdf)
Prospective SBIR/STTR awardees need to complete and submit this form so that the NSF can determine whether they’re eligible for an award. The NSF will use this certification to determine your compliance during the funding term.

[Certificate of Current Cost or Pricing Data (Word doc)]({{ site.baseurl }}/assets/files/grantee-files/Certificate_of_Current_Cost.docx)
The NSF will use this form to certify that your cost and pricing data are accurate and that you’re compliant throughout your funding term.

[SBIR/STTR Phase I Report Cover Page (PDF)]({{ site.baseurl }}/assets/files/grantee-files/SBIR-STTR_Revised_Report_Cover.pdf)
Your Phase I funding agreement notes when you need to complete this form, and you’ll be expected to complete it at the times listed in your funding agreement. Completing the form involves checking all of the boxes and having your authorized officer sign and date the certification each time the NSF requests it.

## For Phase II applicants and awardees

### Forms to apply for and manage Phase II funding

[Company Commercialization History (XLS)]({{ site.baseurl }}/assets/files/grantee-files/CommercialHistoryTemplate.xls)
If you’ve ever received a SBIR/STTR Phase II award from any agency (including the NSF), you’ll need to complete this form.

[Blank Milestone Chart (XLSX)]({{ site.baseurl }}/assets/files/grantee-files/Blank_Milestone_Chart.xlsx)
You need to submit this form to show the duration and expenditures of your current project.

[SBIR/STTR Funding Agreement Certification (PDF)]({{ site.baseurl }}/assets/files/grantee-files/SBIR_STTR_Funding_Agreement.pdf)
Prospective SBIR/STTR awardees need to complete and submit this form so that the NSF can determine whether they’re eligible for an award. The NSF will use this certification to determine your compliance during the funding term.

[Certificate of Current Cost or Pricing Data (Word doc)]({{ site.baseurl }}/assets/files/grantee-files/Certificate_of_Current_Cost.docx)
The NSF will use this form to certify that your cost and pricing data are accurate and that you’re compliant throughout your funding term.

[SBIR/STTR Phase II Report Cover Page (PDF)]({{ site.baseurl }}/assets/files/grantee-files/SBIR-STTR_Revised_Report_Cover.pdf)
Your Phase II funding agreement notes when you need to complete this form, and you’ll be expected to complete it at the times listed in your funding agreement. Completing the form involves checking all of the boxes and having your authorized officer sign and date the certification each time the NSF requests it.

[SBIR/STTR Phase II Administrative and Financial Review video](https://www.youtube.com/playlist?list=PLGhBP1C7iCOmI1p5UtqYCXzmUL9SzSApv)

## General resources

### Spreading the word

As an awardee or alum, you’re the face of our program, and we hope you’ll share news of your successes for years to come. Our [Ambassadors page](https://www.nsf.gov/eng/iip/sbir/ambassador.jsp) offers tips for doing just that.

### Research experiences

Are you a teacher or student who’s interested in research experiences and partnerships with Phase II awardees? Visit our [Research Experiences page](https://www.nsf.gov/eng/iip/sbir/portfolio/researchexp.jsp) to learn more about how you can partner with funded Phase II companies.

## FAQ

Have lingering questions? Visit our [FAQ](https://www.nsf.gov/pubs/2017/nsf17071/nsf17071.jsp), which covers the pre-application process to post-award reporting (and everything in between).
