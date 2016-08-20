describe App do
  it 'works' do
    setup_fake_input('5 5', 'go', '1 2 N', 'LMLMLMLMM', 'output')
    output = capture_output {App.init}
    lines = output.split("\n")
    expect(lines[5]).to eq("1 3 N")
  end
end