Request.delete_all
ActualExpense.delete_all
EstimatedExpense.delete_all
ExpenseReport.delete_all
Trip.delete_all
Department.delete_all
Manager.delete_all
Submitter.delete_all
Approver.delete_all
AdminAccount.delete_all
Account.delete_all

Department.create( 
               :department => 'math', 
               :budget => rand(0.01...10000.99))

Department.create( 
               :department => 'computer science', 
               :budget => rand(0.01...10000.99))

Department.create( 
               :department => 'chemistry', 
               :budget => rand(0.01...10000.99))

Department.create( 
               :department => 'biology', 
               :budget => rand(0.01...10000.99))

Manager.create( :name => 'Predator')

Account.create( 
               :email => 'predator@jmj.rails', 
               :password => 'password', 
               :password_confirmation => 'password', 
               :accountable => Manager.find_by_name("Predator"))

Approver.create( :name => 'Blaze', :department_id => Department.find_by(department: 'computer science').id)

Account.create( 
               :email => 'blaze@jmj.rails', 
               :password => 'password', 
               :password_confirmation => 'password', 
               :accountable => Approver.find_by_name("Blaze"))

Approver.create( :name => 'Briggs', :department_id => Department.find_by(department: 'biology').id)

Account.create( 
               :email => 'briggs@jmj.rails', 
               :password => 'password', 
               :password_confirmation => 'password', 
               :accountable => Approver.find_by_name("Briggs"))

Approver.create( :name => 'Boraicho', :department_id => Department.find_by(department: 'math').id)

Account.create( 
               :email => 'boraicho@jmj.rails', 
               :password => 'password', 
               :password_confirmation => 'password', 
               :accountable => Approver.find_by_name("Boraicho"))

Approver.create( :name => 'Baraka', :department_id => Department.find_by(department: 'chemistry').id)

Account.create(
               :email => 'baraka@jmj.rails',
               :password => 'password',
               :password_confirmation => 'password',
               :accountable => Approver.find_by_name("Baraka"))

Submitter.create( :name => 'Ermac')

Account.create( 
               :email => 'ermac@jmj.rails',
               :password => 'password',
               :password_confirmation => 'password',
               :accountable => Submitter.find_by_name("Ermac"))

Submitter.create( :name => 'Erron')

Account.create( 
               :email => 'erron@jmj.rails',
               :password => 'password',
               :password_confirmation => 'password',
               :accountable => Submitter.find_by_name("Erron"))

AdminAccount.create( :name => 'Admin' )

Account.create( :email => 'admin@jmj.rails', 
                :password => 'password', 
                :password_confirmation => 'password', 
                :accountable => AdminAccount.find_by_name("Admin"))

Trip.create!(
  destination: "ACM Conference 2019 New York",
  purpose: "Poster talk regarding a paper.",
  todate: DateTime.new(2019,2,12),
  fromdate: DateTime.new(2019,2,17),
  status: false,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Ermac").id, 
  approvers_id: Approver.find_by_name("Blaze").id, 
  estimated_expenses_attributes: [{
      expense_type: 'food',
      total: 200,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: false,
          amount_from_total: 1.0 * 200,
          expense_type: 'estimated',
          destination: 'ACM Conference 2019 New York'
      }]
  }]
)

Trip.create!(
  destination: "CSCE 2019",
  purpose: "to attend the panel sessions..",
  todate: DateTime.new(2019,9,1),
  fromdate: DateTime.new(2019,9,3),
  status: true,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Ermac").id, 
  approvers_id: Approver.find_by_name("Blaze").id, 
  estimated_expenses_attributes: [{
      expense_type: 'transportation',
      total: 180,
      status: true,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: true,
          amount_from_total: 1.0 * 180,
          expense_type: 'estimated',
          destination: 'CSCE 2019'
      }]
  }]
)

Trip.create!(
  destination: "CSCE 2018",
  purpose: "to attend the panel sessions..",
  todate: DateTime.new(2018,1,21),
  fromdate: DateTime.new(2018,1,24),
  status: true,
  submitter_id: Submitter.find_by_name("Erron").id, 
  estimated_expenses_attributes: [{
      expense_type: 'transportation',
      total: 180,
      status: true,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: true,
          amount_from_total: 1.0 * 180,
          expense_type: 'estimated',
          destination: 'CSCE 2018'
      }]
  }]
)



Trip.create!(
  destination: "WiCyS 2019",
  purpose: "I'll be attending this event as a graduate student.",
  todate: DateTime.new(2019,7,13),
  fromdate: DateTime.new(2019,7,17),
  status: false,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Erron").id, 
  estimated_expenses_attributes: [
    {#expense 1
      expense_type: 'food',
      total: 200,
      status: false,
      requests_attributes: [
        {#request 1
          department: 'computer science',
          percentrequested: 0.25,
          status: false,
          amount_from_total: 0.25 * 200,
          expense_type: 'estimated',
          destination: 'WiCyS 2019'
        },
        {#request 2
          department: 'chemistry',
          percentrequested: 0.25,
          status: false,
          amount_from_total: 0.25 * 200,
          expense_type: 'estimated',
          destination: 'WiCyS 2019'
        },
        {#request 3
          department: 'biology',
          percentrequested: 0.25,
          status: false,
          amount_from_total: 0.25 * 200,
          expense_type: 'estimated',
          destination: 'WiCyS 2019'
        },
        {#request 4
          department: 'math',
          percentrequested: 0.25,
          status: false,
          amount_from_total: 0.25 * 200,
          expense_type: 'estimated',
          destination: 'WiCyS 2019'
        }
      ]
    },

    {#expense 2
      expense_type: 'transportation',
      total: 300,
      status: false,
      requests_attributes: [
        {#request 1
          department: 'computer science',
          percentrequested: 0.5,
          status: false,
          amount_from_total: 0.5 * 300,
          expense_type: 'estimated',
          destination: 'WiCyS 2019'
        },

        {#request 2
          department: 'biology',
          percentrequested: 0.5,
          status: false,
          amount_from_total: 0.5 * 300,
          expense_type: 'estimated',
          destination: 'WiCyS 2019'
        }
      ]
    }
  ]
)

Trip.create!(
  destination: "CSCE 2017",
  purpose: "to attend the panel sessions..",
  todate: DateTime.new(2017,5,6),
  fromdate: DateTime.new(2017,5,10),
  status: true,
  submitter_id: Submitter.find_by_name("Erron").id, 
  estimated_expenses_attributes: [{
      expense_type: 'transportation',
      total: 180,
      status: true,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: true,
          amount_from_total: 1.0 * 180,
          expense_type: 'estimated',
          destination: 'CSCE 2017'
      }]
  }]
)


Trip.create!(
  destination: "Defcon 2019",
  purpose: "attend hacking convention",
  todate: DateTime.new(2019,12,1),
  fromdate: DateTime.new(2019,12,4),
  status: false,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Ermac").id, 
  estimated_expenses_attributes: [
    {#expense 1
      expense_type: 'food',
      total: 200,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: true,
          amount_from_total: 1.0 * 200,
          expense_type: 'estimated',
          destination: 'Defcon 2019'
      }]
    },

    {#expense 2
      expense_type: 'transportation',
      total: 300,
      status: false,
      requests_attributes: [
        {#request 1
          department: 'computer science',
          percentrequested: 0.5,
          status: true,
          amount_from_total: 0.5 * 300,
          expense_type: 'estimated',
          destination: 'Defcon 2019'
        },

        {#request 2
          department: 'math',
          percentrequested: 0.5,
          status: true,
          amount_from_total: 0.5 * 300,
          expense_type: 'estimated',
          destination: 'Defcon 2019'
        }
      ]
    }
  ]
)

Trip.create!(
  destination: "OurCS Conference 2019",
  purpose: "attending as a faculty mentor",
  todate: DateTime.new(2019,9,1),
  fromdate: DateTime.new(2019,9,3),
  status: false,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Erron").id, 
  estimated_expenses_attributes: [{
      expense_type: 'food',
      total: 200,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: false,
          amount_from_total: 1.0 * 200,
          expense_type: 'estimated',
          destination: 'OurCS Conference 2019'
      }]
  }]
)

Trip.create!(
  destination: "OurCS Conference 2018",
  purpose: "attending as a faculty mentor",
  todate: DateTime.new(2018,9,1),
  fromdate: DateTime.new(2018,9,3),
  status: true,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Erron").id, 
  estimated_expenses_attributes: [{
      expense_type: 'lodging',
      total: 130,
      status: true,
      requests_attributes: [{
          department: 'math',
          percentrequested: 0.45,
          status: true,
          amount_from_total: 0.45 * 130,
          expense_type: 'estimated',
          destination: 'OurCS Conference 2018'
      }]
  }]
)

Trip.create!(
  destination: "ElectroChem 19",
  purpose: "Presenting a paper at conference for electro-chemistry.",
  todate: DateTime.new(2019,12,1),
  fromdate: DateTime.new(2019,12,4),
  status: false,
  managers_id: Manager.find_by_name("Predator").id, 
  submitter_id: Submitter.find_by_name("Erron").id, 
  estimated_expenses_attributes: [
    {#expense 1
      expense_type: 'food',
      total: 200,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: false,
          amount_from_total: 1.0 * 200,
          expense_type: 'estimated',
          destination: 'ElectroChem 19'
      }]
    },

    {#expense 2
      expense_type: 'transportation',
      total: 300,
      status: false,
      requests_attributes: [
        {#request 1
          department: 'chemistry',
          percentrequested: 0.5,
          status: false,
          amount_from_total: 0.5 * 300,
          expense_type: 'estimated',
          destination: 'ElectroChem 19'
        },

        {#request 2
          department: 'biology',
          percentrequested: 0.5,
          status: false,
          amount_from_total: 0.5 * 300,
          expense_type: 'estimated',
          destination: 'ElectroChem 19'
        }
      ]
    }
  ]
)



############################ seed expense reports #####################################


ExpenseReport.create!(
  trip_id: Trip.find_by(destination: 'OurCS Conference 2018').id,
  status: false,
  submitter_id: Submitter.find_by_name("Erron").id, 
  actual_expenses_attributes: [{
      dateincurred: DateTime.new(2018,5,6),
      expense_type: 'lodging',
      total: 130,
      status: false,
      requests_attributes: [{
          department: 'math',
          percentrequested: 0.45,
          status: true,
          amount_from_total: 0.45 * 130,
          expense_type: 'actual',
          destination: 'OurCS Conference 2018'
      }]
  }]
)



ExpenseReport.create!(
  trip_id: Trip.find_by(destination: 'CSCE 2017').id,
  status: false,
  submitter_id: Submitter.find_by_name("Erron").id, 
  actual_expenses_attributes: [{
      dateincurred: DateTime.new(2017,5,6),
      expense_type: 'transportation',
      total: 180,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: false,
          amount_from_total: 1.0 * 180,
          expense_type: 'actual',
          destination: 'CSCE 2017'
      }]
  }]
)



ExpenseReport.create!(
  trip_id: Trip.find_by(destination: 'CSCE 2018').id,
  status: false,
  submitter_id: Submitter.find_by_name("Erron").id, 
  actual_expenses_attributes: [{
      dateincurred: DateTime.new(2018,12,25),
      expense_type: 'transportation',
      total: 180,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: false,
          amount_from_total: 1.0 * 180,
          expense_type: 'actual',
          destination: 'CSCE 2018'
      }]
  }]
)





ExpenseReport.create!(
  trip_id: Trip.find_by(destination: 'CSCE 2019').id,
  status: false,
  submitter_id: Submitter.find_by_name("Ermac").id, 
  actual_expenses_attributes: [{
      dateincurred: DateTime.new(2019,9,23),
      expense_type: 'transportation',
      total: 180,
      status: false,
      requests_attributes: [{
          department: 'computer science',
          percentrequested: 1.0,
          status: false,
          amount_from_total: 1.0 * 180,
          expense_type: 'actual',
          destination: 'CSCE 2019'
      }]
  }]
)

