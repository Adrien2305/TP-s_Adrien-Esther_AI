% Knowledge base
% Define the available responses for different user inputs related to Cancer treatment

response(greeting, "Hello! I'm your Cancer treatment assistant. How can I help you today?").
response(support, "Sure, I'm here to assist you with any questions or concerns about Cancer treatment.").
response(treatment_type, "There are several types of Cancer treatments, including surgery, chemotherapy, radiation therapy, immunotherapy, and targeted therapy. The choice of treatment depends on the type and stage of Cancer. Can you provide more information about the specific type of Cancer you are interested in?").
response(side_effects(chemotherapy), "Common side effects of chemotherapy include nausea, hair loss, fatigue, and decreased immunity. However, it's important to note that side effects can vary based on the specific drugs used and individual differences. It's best to consult with a healthcare professional for personalized information.").
response(side_effects(radiation_therapy), "Common side effects of radiation therapy may include skin changes, fatigue, and localized symptoms based on the treatment area. Side effects can vary depending on the specific type and location of Cancer being treated. A medical professional can provide more specific information.").
response(risk_factors, "Several factors can increase the risk of developing Cancer, including age, family history, exposure to certain chemicals or substances, unhealthy lifestyle choices (such as smoking or excessive alcohol consumption), and certain infections. It's important to consult with a healthcare professional for a personalized assessment of your risk factors.").
response(treatment_centers, "There are several renowned Cancer treatment centers worldwide, including Memorial Sloan Kettering Cancer Center, MD Anderson Cancer Center, and Mayo Clinic. It's important to research and choose a center that specializes in the type of Cancer you're dealing with and offers comprehensive treatment options.").
response(thank_you, "You're welcome! If you have any more questions, feel free to ask.").
response(farewell, "Thank you for using our Cancer treatment assistant. Take care and stay healthy!").


% Rules to handle user queries

handle_query(greeting) :-
    response(greeting, Response),
    write(Response), nl.

handle_query(thank_you) :-
    response(thank_you, Response),
    write(Response), nl.

handle_query(farewell) :-
    response(farewell, Response),
    write(Response), nl.

handle_query(treatment_type) :-
    response(treatment_type, Response),
    write(Response), nl.

handle_query(side_effects(chemotherapy)) :-
    response(side_effects(chemotherapy), Response),
    write(Response), nl.

handle_query(side_effects(radiation_therapy)) :-
    response(side_effects(radiation_therapy), Response),
    write(Response), nl.

handle_query(risk_factors) :-
    response(risk_factors, Response),
    write(Response), nl.

handle_query(treatment_centers) :-
    response(treatment_centers, Response),
    write(Response), nl.

handle_query(_) :-
    write("I'm sorry, but I didn't understand your query. Can you please rephrase?"), nl.


% Main loop for the chatbot

chatbot :-
    write("Welcome to Cancer Treatment Assistant. How can I assist you today?"), nl,
    write("Enter 'exit' to end the conversation."), nl,
    read_user_input.

read_user_input :-
    write("> "),
    read_line(Query),
    process_user_input(Query).

process_user_input(exit) :-
    handle_query(farewell).

process_user_input(Query) :-
    handle_query(Query),
    read_user_input.

read_line(X) :-
    read_line_to_codes(user_input, Codes),
    atom_codes(X, Codes).
