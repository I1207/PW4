# param_grids = {
    # 'LinearRegression': {'fit_intercept': [True, False]},
    # 
    # 'GradientBoostingRegressor': {
        # 'n_estimators': [50, 100, 200],
        # 'learning_rate': [0.01, 0.1, 0.2],
        # 'max_depth': [3, 5, 10],
        # 'min_samples_split': [2, 5, 10]
    # },
    # 
    # 'AdaBoostRegressor': {
        # 'n_estimators': [50, 100, 200],
        # 'learning_rate': [0.01, 0.1, 0.2]
    # },
    
#  'Lasso': {'alpha': [0.2, 0.5, 0.8]},
#  
#  'DecisionTreeRegressor': {
#      'max_depth': [None, 5, 10, 20],
#      'min_samples_split': [2, 5, 10]
#  },
#  
#  'RandomForestRegressor': {  
#      'n_estimators': [50, 100, 200],
#      'max_depth': [None, 5, 10, 20],
#      'min_samples_split': [2, 5, 10]
#  },
#  
#  'KNeighborsRegressor': {
#      'n_neighbors': [3, 5, 10],  
#      'weights': ['uniform', 'distance']
#  }
# }

#  # Loop over models
#    for name, model in models.items():
#        # Define the parameter grid for the current model
#        param_grid = param_grids.get(name, {})  # Get the corresponding hyperparameter grid
#
#        # Perform grid search for hyperparameter tuning
#        grid_search = GridSearchCV(model, param_grid, scoring='neg_mean_squared_error', cv=5)
#        grid_search.fit(X_train, y_train)
#
#        # Use the best parameters to train the model
#        best_model = grid_search.best_estimator_
#        best_model.fit(X_train, y_train)
#
#        # Make predictions
#        y_pred = best_model.predict(X_test)
#
#        # Evaluate the model
#        mse, r2, explained_variance, max_err = (
#            mean_squared_error(y_test, y_pred),
#            r2_score(y_test, y_pred),
#            explained_variance_score(y_test, y_pred),
#            np.max(np.abs(y_test - y_pred)),
#        )
#
#        # Append results to the list
#        results.append({
#            'Model': name,
#            'Target': target,
#            'MSE': mse,
#            'R^2': r2,
#            'Explained Variance': explained_variance,
#            'Max Error': max_err
#        })
#
#        # Plot and save the learning curve
#        plot_learning_curve(best_model, X_train, y_train,target,name)  #(model, X_train, y_train, target, name)
#        plt.savefig(f'{name}_{target}_learning_curve.png')
#        plt.close()
#
## Convert the results list to a DataFrame
#results_df = pd.DataFrame(results)
#
## Save the DataFrame to a CSV file
#results_df.to_csv('model_evaluation_results.csv', index=False)