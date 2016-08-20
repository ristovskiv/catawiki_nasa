describe App do
  it 'works' do
    allow(App).to receive(:gets).and_return('5 5', 'go', '1 2 N', 'LMLMLMLMM', 'output')
    expect { App.init }.to output(/1 3 N/).to_stdout
  end
end