void fit_distributions(int channel){
  // int channel = atof(argv[1]);
  char title_file[200];
  sprintf(title_file,"./files_distributions/merged_rayleigh.root");
  TFile *f = new TFile(title_file,"READ");

  //TTree *myTree[16];
  //double magnitude[16][513];
  TH1F *h1[513];
  const double dF = 1000./512.;
  // for(int channel=0;channel<16;channel++){//channel loop
    char treeName[50];
    sprintf(treeName,"Spectral_Dist%d",channel);
    
    for(int freqBin;freqBin<513; freqBin++){
      if(channel==0 && freqBin==1) continue;
      char branchName[20];
      sprintf(branchName,"magnitudes_%d",freqBin);
      TTreeReader myReader(treeName, f);
      // myReader.SetTree(treeName);
      //myReader.GetTree();
      TTreeReaderValue<Double_t> magnitudes(myReader, branchName);
      char h1name[100];
      sprintf(h1name,"h1 for channel%d, freq=%.2f",channel, freqBin*dF);
      h1[freqBin] = new TH1F(h1name,h1name,500,1,1);
      while (myReader.Next()) {
	h1[freqBin]->Fill(*magnitudes);
      }
      myReader.Restart();//Need to restart the reader!!
    }

    /*
      myTree[channel] = (TTree*) f->Get(treeName);
      char hname[20];
      for(int j = 0; j<513; j++){
      sprintf(hname,"magnitudes_%d",j);
      myTree[channel]->SetBranchAddress(hname, &magnitude[channel][j]);
      }
    */

    // }//end channel loop

  //  /*
    char title_txt[200];
    sprintf(title_txt,"sigmavsfreq_ch%d.txt",channel);
    FILE *fout = fopen(title_txt, "w");
    //  for(int channel=0;channel<16;channel++){//channel loop
    for(int index = 0; index<513; index++){
      if(channel==0 && index==1) continue;
      Double_t scale1 = 1/h1[index]->Integral("width");
      h1[index]->Scale(scale1);
      //h1[index]->Sumw2();
      //f1->SetParameters(8.16779e-03,1.12821e-02);
      int binmax = h1[index]->GetMaximumBin();//Get bin of max value
      double y_max = h1[index]->GetBinContent(binmax); //get value of that bin
      double x_max = h1[index]->GetXaxis()->GetBinCenter(binmax);
      Double_t p0, p1, chi2;

      // cout <<"x_max "<< x_max<<endl;
      /*  if(x_max<=0.15){
	  int binmax2 = h2[index]->GetMaximumBin();//Get bin of max value
	  TF1 *f1 = new TF1("f1","([0]*x)/([1]*[1])*exp(-[0]*[0]*x*x/(2.*[1]*[1]))",0,h2[index]->GetXaxis()->GetBinCenter(binmax2));
	  f1->SetParameters(h2[index]->GetMaximum(),h2[index]->GetRMS());
	  gStyle->SetOptFit(1111);
	  Double_t scale2 = 1/h2[index]->Integral("width");
	  h2[index]->Sumw2();
	  h2[index]->Scale(scale2);
	  f1->SetParameters(h2[index]->GetMaximum(),h2[index]->GetRMS());
	  gStyle->SetOptFit(1111);
	  h2[index]->Fit("f1","ELQM");
	  p0 = f1->GetParameter(0);
	  p1 = f1->GetParameter(1);
	  chi2 = f1->GetChisquare()/f1->GetNDF(); //Reduced
	  delete f1;
	  }*/
      //  else if(x_max>0.15){
      TF1 *f1 = new TF1("f1","([0]*x)/([1]*[1])*exp(-[0]*[0]*x*x/(2.*[1]*[1]))",0,h1[index]->GetXaxis()->GetBinCenter(binmax));
      f1->SetParameters(h1[index]->GetMaximum(),h1[index]->GetRMS());
      gStyle->SetOptFit(1111);
      f1->SetParameters(h1[index]->GetMaximum(),h1[index]->GetRMS());
      gStyle->SetOptFit(1111);
      h1[index]->Fit("f1","ELQMW");
      p0 = f1->GetParameter(0);
      p1 = f1->GetParameter(1);
      chi2 = f1->GetChisquare()/f1->GetNDF(); //Reduced
      delete f1;
       fprintf(fout,"%2.4f,%d,%2.4f,%2.4f  \n",index*dF,channel,p1,chi2);
       ///*
       if(index<=15){
	 char name[40];
	 sprintf(name, "./distributions/distributionch%d_%d.png", channel, index);
	 TCanvas *c2 = new TCanvas("","",850,850);
	 h1[index]->Draw(); 
	 c2->SaveAs(name);
	 delete c2;
       }
      //    */
      
      
      //  }

    }
    fclose(fout);//close sigmavsfreq.txt file
}///end main
