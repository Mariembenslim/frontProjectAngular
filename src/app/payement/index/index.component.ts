import { Component, OnInit } from '@angular/core';
import { Payement } from '../payement';
import { PayementService } from '../payement.service';
import { AuthService } from 'src/app/authentification/auth.service';
@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit  {

  dtOptions: DataTables.Settings = {};
  constructor(public payementService: PayementService, public authService: AuthService) { }

  payement: Payement[] = [];

  ngOnInit(): void {

    const userid = this.authService.getUserId();
    this.payementService.getAllPaymentsbyid(userid).subscribe((data: Payement[])=>{

      this.payement = data;

      console.log(this.payement);

    })  

  }

}
