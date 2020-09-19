ActiveAdmin.register Quiz do
  permit_params :title, :correct, :uncorrect1, :uncorrect2, :explanation
end
