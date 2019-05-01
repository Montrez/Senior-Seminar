<!-- $theme: gaia -->
<!-- page_number: true-->


# JMJ ==Travel== Tracker

#### cox-oldfield-wardell.herokuapp.com

###### Created by ==Johnnie==, ==Montrez==, and ==Joanne==

---
<!-- page_number: true-->
<!-- *template: invert -->
#### *Automate Travel : ==Requests &  Funding==*
*<small>==Design==</small>*
<hr>

* tailored experience per user
* generate travel refund documentation
     * estimates / actual
* process corporate reimbursement
* reveal data relationships with graphs


---

<!-- *template: invert -->
<!-- page_number: true-->

#### *Unique Features*
* charts via gem `chartkick`
* easy to use forms via `cacoon`
* paginated data via `will_paginate`
* detailed status information in portals
---

<!-- *template: invert -->
<!-- page_number: true-->

#### *Use Cases 1-2*

1. ==travel auth.== form approved by all users
     * emp login, form creation
     * approvers click approval buttons
     * manager sees form, approves
2. ==travel auth.== form denied by approvers
	 * emp login, form creation
	 * approvers deny, emp  correction, resubmission
	 * approvers adjust statuses, manager(s) approve


---
<!-- *template: invert -->
<!-- page_number: true-->

#### *Use Cases 3-4*

3. ==expense report== approved by all users
     * emp login, report creation
     * approvers click approval buttons
     * manager sees report, approves
4. ==expense report== with itemized expenses
	 * emp login, form creation, itemization
	 * approvers approve requests per dept.
	 * form reaches manager, manager approves


---
<!-- *template: invert -->
<!-- page_number: true-->

#### *Use Cases 5-6*

5. ==expense report== denied by approvers
     * emp login, form creation
     * approvers deny expenses
     * emp login, correction, resubmission
     * approvers change statuses, manager approval
6. ==expense report== denied by manager
	 * emp login, form creation
	 * approvers :heavy_check_mark: , reaches manager :x:
	 * emp resub :arrow_right: approvers :heavy_check_mark:, managers :heavy_check_mark: