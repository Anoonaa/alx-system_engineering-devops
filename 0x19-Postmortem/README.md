Postmortem: Project Issue on the 10th of  April , 2024
Summary
On April 10, 2024, our medical question answering web application, hosted on GitHub Pages, experienced an outage that lasted for approximately 3 hours from 2:00 PM to 5:00 PM (GMT). The outage was caused by an expired SSL certificate(I was sure the fault would have been related to  our poor code being broken ,haha), which resulted in users being unable to securely access the site. The impact was substantial, affecting around 60% of our users who faced security warnings and blocked access from some browsers.

Timeline
2:00 PM - Monitoring alerts indicate SSL certificate expired.
4:00 PM - A kind User reports security warnings and inability to access the site.
4:10 PM - Incident escalated to the DevOps team.
4:20 PM - Initial investigation confirms SSL certificate expiration.
4:30 PM - Misleading path: Team briefly investigates potential server misconfigurations.
5:00 PM - Certificate renewal process initiated, but delayed due to verification issues.
7:00 PM - Verification completed and new SSL certificate issued.
7:30 PM - New certificate deployed and tested.
8:00 PM - Full functionality confirmed and normal operations resumed.
9:00 PM - Postmortem conducted to analyze incident and outline preventive measures.
Cause
The root cause was an expired SSL certificate. The automated renewal process failed due to an incorrect email address for domain verification, resulting in the SSL certificate not being renewed before its expiration date.

Impact
The outage affected approximately 60% of our users. Users faced security warnings and were blocked from accessing the site by some browsers, causing a significant disruption in their ability to obtain medical information.(all because of an email address , full-stack simpleton i bestow upon myself hahaha/ )

Mitigation
The issue was resolved by manually renewing the SSL certificate and updating the domain verification email address to ensure future renewals are successful. The DevOps team verified the deployment of the new certificate and tested the site for secure access.

Corrective and Preventative Measures
Improvements:
Improve the SSL certificate renewal process and ensure correct contact information.
Enhance monitoring and alerting for SSL certificate expiration.
Tasks:
Review and update the SSL certificate renewal process.
Ensure correct and updated contact information for domain verification.
Implement additional monitoring for SSL certificate expiration alerts.
Conduct training sessions on SSL certificate management for the DevOps team.
Establish a secondary contact method for SSL renewal notifications.
Develop a checklist for SSL renewal procedures to prevent future oversights.

